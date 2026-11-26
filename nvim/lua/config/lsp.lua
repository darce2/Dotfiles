local servers = {
  "ts_ls",
  "eslint",
  "cssls",
  "graphql",
  "tailwindcss",
  "pyright",
  "yamlls",
  "jsonls",
}

require("mason").setup()
require("mason-lspconfig").setup({
  automatic_enable = false,
})

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { only_current_line = true },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.lsp.enable(servers)

local function install_servers()
  if vim.g.dotfiles_config_loaded ~= true then
    error("Neovim config did not finish loading")
  end

  local lock_path = vim.fs.joinpath(vim.fn.stdpath("config"), "nvim-pack-lock.json")
  local lock = vim.json.decode(table.concat(vim.fn.readfile(lock_path), "\n")).plugins
  local installed_plugins = {}

  for _, plugin in ipairs(vim.pack.get()) do
    installed_plugins[plugin.spec.name] = plugin
  end

  local missing_plugins = {}
  for name, locked in pairs(lock) do
    local plugin = installed_plugins[name]
    if not plugin or not plugin.active or plugin.rev ~= locked.rev then
      missing_plugins[#missing_plugins + 1] = name
    end
  end

  if #missing_plugins > 0 then
    error("vim.pack plugins are missing or do not match the lockfile: " .. table.concat(missing_plugins, ", "))
  end

  vim.cmd("LspInstall " .. table.concat(servers, " "))

  local mappings = require("mason-lspconfig").get_mappings()
  local registry = require("mason-registry")
  local missing = {}

  for _, server in ipairs(servers) do
    local package = mappings.lspconfig_to_package[server]
    if not package or not registry.get_package(package):is_installed() then
      missing[#missing + 1] = server
    end
  end

  if #missing > 0 then
    error("Mason did not install: " .. table.concat(missing, ", "))
  end
end

vim.api.nvim_create_user_command("DotfilesInstallServers", install_servers, {
  desc = "Install the configured language servers through Mason",
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("DotfilesLspKeymaps", { clear = true }),
  callback = function(event)
    local bufnr = event.buf
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    end

    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, {
        buffer = bufnr,
        silent = true,
        desc = desc,
      })
    end

    map("n", "gD", vim.lsp.buf.declaration, "LSP declaration")
    map("n", "gd", vim.lsp.buf.definition, "LSP definition")
    map("n", "K", vim.lsp.buf.hover, "LSP hover")
    map("n", "gi", vim.lsp.buf.implementation, "LSP implementation")
    map("n", "<leader>k", vim.lsp.buf.signature_help, "LSP signature help")
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
    map("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "List workspace folders")
    map("n", "<leader>D", vim.lsp.buf.type_definition, "LSP type definition")
    map("n", "<leader>rn", vim.lsp.buf.rename, "LSP rename")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "LSP code action")
    map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostic")
    map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
    map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
    map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics to location list")
    map("n", "<leader>fl", function()
      vim.lsp.buf.format({ async = true, bufnr = bufnr })
    end, "Format with LSP")

    map({ "n", "x" }, "<leader>fp", function()
      local range
      if vim.fn.mode():match("^[vV]") then
        local start_pos = vim.api.nvim_buf_get_mark(bufnr, "<")
        local end_pos = vim.api.nvim_buf_get_mark(bufnr, ">")
        range = {
          start = { start_pos[1] - 1, start_pos[2] },
          ["end"] = { end_pos[1] - 1, end_pos[2] },
        }
      end
      vim.lsp.buf.format({ async = true, bufnr = bufnr, range = range })
    end, "Format with LSP")
  end,
})

vim.keymap.set("i", "<C-Space>", function()
  vim.lsp.completion.get()
end, { silent = true, desc = "Trigger LSP completion" })

local function completion_tab(next_item)
  if vim.fn.pumvisible() == 1 then
    return next_item and "<C-n>" or "<C-p>"
  end
  return next_item and "<Tab>" or "<S-Tab>"
end

vim.keymap.set("i", "<Tab>", function()
  return completion_tab(true)
end, { expr = true, silent = true, desc = "Next completion item" })

vim.keymap.set("i", "<S-Tab>", function()
  return completion_tab(false)
end, { expr = true, silent = true, desc = "Previous completion item" })

vim.keymap.set("i", "<CR>", function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
end, { expr = true, silent = true, desc = "Accept completion item" })

vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }

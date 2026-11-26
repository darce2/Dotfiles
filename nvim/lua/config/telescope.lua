require("telescope").setup({
  defaults = {
    layout_strategy = "vertical",
    layout_config = {
      prompt_position = "top",
      mirror = true,
      width = 0.95,
      height = 0.95,
      preview_height = 0.7,
    },
    file_ignore_patterns = { "%.git/.*" },
  },
  pickers = {
    find_files = { hidden = true },
    live_grep = {
      additional_args = function()
        return { "--hidden" }
      end,
    },
  },
  extensions = {
    file_browser = { hidden = true },
  },
})

require("telescope").load_extension("file_browser")

local builtin = require("telescope.builtin")
local map = vim.keymap.set
local opts = { silent = true, desc = "Telescope" }

map("n", "<leader>ff", builtin.find_files, opts)
map("n", "<leader>fk", builtin.find_files, { silent = true, desc = "Find files" })
map("n", "<leader>fg", builtin.live_grep, opts)
map("n", "<leader>fb", builtin.buffers, { silent = true, desc = "Buffers" })
map("n", "<leader>fh", builtin.help_tags, opts)
map("n", "<leader>nn", "<cmd>Telescope file_browser path=%:p:h<cr>", {
  silent = true,
  desc = "Browse files",
})
map("n", "<leader>gr", builtin.lsp_references, {
  silent = true,
  desc = "LSP references",
})

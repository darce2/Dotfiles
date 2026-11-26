local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>+", "<cmd>vertical resize +5<cr>", opts)
map("n", "<leader>=", "<cmd>vertical resize -5<cr>", opts)
map("n", "<leader>b[", "<cmd>bnext<cr>", { silent = true, desc = "Next buffer" })
map("n", "<leader>b]", "<cmd>bprevious<cr>", { silent = true, desc = "Previous buffer" })
map("n", "<leader>bp", "<cmd>Telescope buffers<cr>", {
  silent = true,
  desc = "Pick a buffer",
})

map("n", "<leader>bc", function()
  local buffers = vim.tbl_filter(function(buffer)
    return buffer.listed == 1
  end, vim.fn.getbufinfo())

  vim.ui.select(buffers, {
    prompt = "Close buffer",
    format_item = function(buffer)
      if buffer.name == "" then
        return "[No Name]"
      end
      return vim.fn.fnamemodify(buffer.name, ":~:.")
    end,
  }, function(buffer)
    if buffer then
      vim.api.nvim_buf_delete(buffer.bufnr, { force = true })
    end
  end)
end, { desc = "Pick a buffer to close" })

map({ "n", "x", "o" }, "<C-n>", "<Esc><cmd>tabnext<cr>", opts)
map({ "n", "x", "o" }, "<C-p>", "<Esc><cmd>tabprevious<cr>", opts)

map("x", "<leader>p", '"_dP', opts)
map("x", "<leader>a", ":sort<cr>", opts)
map("x", "<", "<gv", opts)
map("x", ">", ">gv", opts)

map("n", "<C-j>", "<C-w><C-j>", opts)
map("n", "<C-k>", "<C-w><C-k>", opts)
map("n", "<C-l>", "<C-w><C-l>", opts)
map("n", "<C-h>", "<C-w><C-h>", opts)

local function clean_buffer()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  for index, line in ipairs(lines) do
    line = line:gsub("\t", "  "):gsub("%s+$", "")
    line = line:gsub("{%s*(.-)%s*}", "{ %1 }"):gsub("{%s*}", "{}")
    lines[index] = line
  end

  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  cursor[2] = math.min(cursor[2], #lines[cursor[1]])
  vim.api.nvim_win_set_cursor(0, cursor)
  vim.bo.fileformat = "unix"
end

vim.api.nvim_create_user_command("Clean", clean_buffer, {
  desc = "Normalize whitespace and brace spacing in the current buffer",
})

map("n", "<leader>9", "<cmd>Clean<cr>", { desc = "Clean whitespace and braces" })

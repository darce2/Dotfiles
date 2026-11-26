if vim.fn.has("nvim-0.12") ~= 1 then
  error("This config requires Neovim 0.12 or newer for vim.pack.")
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.copilot_no_tab_map = true

require("config.plugins")
require("config.options")
require("config.keymaps")
require("config.lsp")
require("config.telescope")
require("config.gitsigns")
require("config.surround")
require("config.copilot")
require("config.autocmds")

vim.g.dotfiles_config_loaded = true

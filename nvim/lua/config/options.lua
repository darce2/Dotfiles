local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.autoindent = true
opt.softtabstop = 2
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.textwidth = 0
opt.wrap = false
opt.formatoptions:remove("t")
opt.colorcolumn = "80"

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.inccommand = "split"

opt.foldmethod = "indent"
opt.foldlevel = 2
opt.foldnestmax = 10
opt.foldenable = false

opt.autoread = true
opt.cmdheight = 0
opt.laststatus = 0
opt.spell = true
opt.mouse = "a"
opt.clipboard = "unnamed"
opt.termguicolors = true
opt.hidden = true
opt.path:append("**")
opt.path:remove("**/node_modules/*")
opt.wildmenu = true
opt.wildignore:append({
  "**/node_modules/*",
  "**/lib/*",
  "**/coverage/*",
})
opt.list = true
opt.undofile = true
opt.undodir = vim.fn.expand("~/.undo")

vim.fn.mkdir(vim.fn.expand("~/.undo"), "p")

vim.cmd.colorscheme("tokyonight-moon")

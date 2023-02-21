call plug#begin('~/.vim/autoload/plugged')

"lua support for neovim plugins
Plug 'nvim-lua/plenary.nvim'

" Git support
Plug 'lewis6991/gitsigns.nvim'

" file finder and search
Plug 'nvim-telescope/telescope.nvim'
" needed for telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'kyazdani42/nvim-web-devicons'

" File explorer
Plug 'nvim-telescope/telescope-file-browser.nvim'

" language server support config
Plug 'neovim/nvim-lspconfig'
" helper plugin to manage language servers
Plug 'williamboman/nvim-lsp-installer'
" formatting support but doesn't seem to work :/
Plug 'MunifTanjim/prettier.nvim'
" autocompletion with lsp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" " these are required for snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

" testing out diagnostics
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

" tab support
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

" Easy commenting and uncommenting
Plug 'preservim/nerdcommenter'
" surrounds!
Plug 'kylechui/nvim-surround'

" Customized vim status line
Plug 'nvim-lualine/lualine.nvim'

" a colorscheme
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" help to learn what actions are available
Plug 'folke/which-key.nvim'

""" language specific 
"graphql syntax
Plug 'jparise/vim-graphql'

" required
call plug#end()
filetype plugin indent on

call plug#begin('~/.vim/autoload/plugged')

" Plug 'Townk/vim-autoclose'                " Automatically closes parenthesis and quores
" Plug 'tpope/vim-surround'                 " Allows easy surrounding of words and text in quotes and such
" Plug 'alvan/vim-closetag'                   " Automatically closes html tags on >
" Plug 'pseewald/vim-anyfold'

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
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

" language server support config
Plug 'neovim/nvim-lspconfig'
" helper plugin to manage language servers
Plug 'williamboman/nvim-lsp-installer'
" autocompletion with lsp
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

" previously used autocomplete --------
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'hrsh7th/nvim-cmp'
" " these are required
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'
" ----------

" handle references in a popup window
" Plug 'rmagatti/goto-preview'
" Plug 'wiliamks/nice-reference.nvim'

" Easy commenting and uncommenting
Plug 'scrooloose/nerdcommenter'

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" a colorscheme
Plug 'morhetz/gruvbox'

" help to learn what actions are available
Plug 'folke/which-key.nvim'

""" language specific 
"graphql syntax
Plug 'jparise/vim-graphql'

" required
call plug#end()
filetype plugin indent on

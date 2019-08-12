call plug#begin('~/.vim/autoload/plugged')

" Plug 'Townk/vim-autoclose'                " Automatically closes parenthesis and quores
" Plug 'tpope/vim-surround'                 " Allows easy surrounding of words and text in quotes and such
" Plug 'alvan/vim-closetag'                   " Automatically closes html tags on >
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " Auto completion async
" Plug 'w0rp/ale'                           " async linting
" Plug 'mbbill/undotree'                    " A plugin for visualizing VIM's undo/redo tree
" Plug 'pseewald/vim-anyfold'

" Git support
Plug 'tpope/vim-fugitive'                 " Git integration
"
" Markdown support
Plug 'shime/vim-livedown'                 " Git integration

" Snippet support
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" File explorer
Plug 'scrooloose/nerdtree'

" Easy commenting and uncommenting
Plug 'scrooloose/nerdcommenter'

" Coc is an intellisense engine for vim8 & neovim.
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" fuzzy file finder and buffer manager not sure if should stay
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" a colorscheme
Plug 'morhetz/gruvbox'


" language specif plugins
source ~/.config/nvim/config/plugins/javascript.vim
source ~/.config/nvim/config/plugins/typescript.vim

" required
call plug#end()
filetype plugin indent on

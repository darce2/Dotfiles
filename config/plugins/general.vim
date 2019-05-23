" set the runtime path to include Vundle and initialize
" let path="~/.config/nvim/bundle"
call plug#begin('~/.vim/autoload/plugged')

" Plug 'bling/vim-airline'                  " Status bar
" Plug 'vim-airline/vim-airline-themes'     " Adds a directory of Airline Themes
" Plug 'mkitt/tabline.vim'                  " Displays window tabs
Plug 'w0rp/ale'                           " async linting 
Plug 'Townk/vim-autoclose'                " Automatically closes parenthesis and quores
Plug 'alvan/vim-closetag'                   " Automatically closes html tags on >
Plug 'scrooloose/nerdtree'                " File explorer
Plug 'scrooloose/nerdcommenter'           " Easy commenting and uncommenting
Plug 'tpope/vim-fugitive'                 " Git integration
Plug 'tpope/vim-surround'                 " Allows easy surrounding of words and text in quotes and such
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " Auto completion async
Plug 'morhetz/gruvbox'                     " a colorscheme
" Plug 'mbbill/undotree'                    " A plugin for visualizing VIM's undo/redo tree
" Plug 'pseewald/vim-anyfold'


" language specif plugins
source ~/.config/nvim/config/plugins/javascript.vim
source ~/.config/nvim/config/plugins/typescript.vim
" source ~/.config/nvim/config/plugins/markdown.vim


" function! DoRemote(arg)
" UpdateRemotePlugins
" endfunction

" Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }     " Async autocomplete

call plug#end()              " required
filetype plugin indent on    " required

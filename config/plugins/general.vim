set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" let path="~/.config/nvim/bundle"
call plug#begin('~/.vim/autoload/plugged')

" Plug 'bling/vim-airline'                  " Status bar
" Plug 'mkitt/tabline.vim'                  " Displays window tabs
Plug 'w0rp/ale'                           " async linting 
Plug 'Townk/vim-autoclose'                " Automatically closes parenthesis and quores
Plug 'docunext/closetag.vim'              " Closes html tags when I type </
Plug 'scrooloose/nerdtree'                " File explorer
" Plug 'scrooloose/nerdcommenter'           " Easy commenting and uncommenting
Plug 'tpope/vim-fugitive'                 " Git integration
Plug 'tpope/vim-surround'                 " Allows easy surrounding of words and text in quotes and such
" Plug 'godlygeek/tabular'                  " Don't know what this is or how it got here
" Plug 'simeji/winresizer'                  " Easy window resizing
" Plug 'vim-scripts/RangeMacro'             " Easily applies macro to a range of lines
" Plug 'SirVer/ultisnips'                   " Gotta love your snippets
" Plug 'vim-airline/vim-airline-themes'     " Adds a directory of Airline Themes
" Plug 'honza/vim-snippets'                 " more snippets
" Plug 'vim-syntastic/syntastic'            " Google-friendly syntax linter
" Plug 'junegunn/fzf',  { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'bluz71/vim-moonfly-colors'          " a colorscheme
" Plug 'mbbill/undotree'                     " A plugin for visualizing VIM's undo/redo tree
" Plug 'pseewald/vim-anyfold'


" language specif plugins
" source ~/.config/nvim/config/plugins/java.vim
source ~/.config/nvim/config/plugins/javascript.vim
" source ~/.config/nvim/config/plugins/python.vim
" source ~/.config/nvim/config/plugins/markdown.vim
" source ~/.config/nvim/config/plugins/elixir.vim
" source ~/.config/nvim/config/plugins/solidity.vim

" function! DoRemote(arg)
" UpdateRemotePlugins
" endfunction

" Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }     " Async autocomplete

call plug#end()              " required
filetype plugin indent on    " required

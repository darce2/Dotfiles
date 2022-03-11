set encoding=UTF-8
set relativenumber                      " enables relative number
set number                              " shows the number of current line
set autoindent                          " automatically indents
set softtabstop=2                       " sets default tab stop to 2
set tabstop=2                           " sets default tab stop to 2
set shiftwidth=2                        " the number of spaces inserted for a tab
set expandtab                           " expands tabs to spaces
set tw=0                                " width of the document (used by GD)
set nowrap                              " don't automatically wrap on load
set fo-=t                               " don't automatically wrap text when typing
set colorcolumn=80                      " colors 80th collumn
set ignorecase                          " ignore case in search
set smartcase                           " becomes case sensitive once you use a case
set hlsearch                            " highlights search
set incsearch                           " searches while typing
set foldmethod=indent                   " fold code based on indenting level
set foldlevel=3                         " sets foldlevel to 0, all folds closed
set autoread                            " updates if file on disk updates from external source
set nocompatible                        " be iMproved, required
filetype off                            " required

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP                


filetype indent on                              " Not sure what this does
filetype plugin on                              " used for nerdcommentor to load plugins for specific file types
syntax on                                       " Turns on syntax highlighting
autocmd! bufwritepost *.vim source %         " Auto reloads my vimrc on write

set clipboard=unnamed                           " allows me to copy and past outside of terminal
set termguicolors                               " set true color support

let mapleader = "\<space>"                      " asign leader to the space key
let localleader = "\\"                          " assign local leader to \ key

" resize panes
noremap <silent> <Leader>+ :vertical resize +5 <CR>
noremap <silent> <Leader>= :vertical resize -5 <CR>
noremap <leader>fk :FZF <CR>

" move between tabs with, N or P ( left and right respectively)
map <C-n> <esc>:tabnext<CR>
map <C-p> <esc>:tabprevious<CR>

" Alphabetically sort lines of code in visual mode
vnoremap <Leader>a :sort<CR>

" Easy shifting
vnoremap < <gv
vnoremap > >gv

" move between pane using control keys and H,J,K,L
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" Autosave 
" inoremap <esc> <esc>:w<cr>

" File exploring settings
set hidden                                      "instead of closing unsave buf on file open :ls :b[N]
set path+=**
set path-=**/node_modules/*
set wildmenu
set wildignore+=**/node_modules/*
set wildignore+=**/lib/*
set wildignore+=**/coverage/*

" File exploring shortcuts
" nnoremap <Leader>ft  :tabnew<cr>:find \c
" nnoremap <Leader>ff  :find \c
" nnoremap <Leader>fb  :ls<CR>:b
" nnoremap <Leader>fs  :vsplit<CR>:find \c
" nnoremap <Leader>fi  :split<CR>:find \c
" nnoremap <Leader>fv  :find ~/.config/nvim/config/settings/general.vim<CR>
" nnoremap <Leader>fp  :find ~/.config/nvim/config/plugins/general.vim<CR>
" nnoremap <Leader>f#  :b#<CR>

" live substitue
" set inccommand=split

" au BufNewFile,BufRead *.vim set filetype=vim

" Capitalizes the word that was just written and enters insert mode at the end
" of the word
" inoremap <C-u> <esc>hviwUea

" movement command highlight the text inside he next parenthesis
" onoremap in( :<C-u>normal! f(vi)<cr>
" movement command highlight the text inside he previous parenthesis
" onoremap ip( :<C-u>normal! F)vi(<cr>



set undofile " Maintain undo history between sessions
set undodir=~/.undo


" start nerdtree if no files are selected when running vim
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" show hidden files
let NERDTreeShowHidden=1

" === Nerdtree shorcuts === "
nmap <Leader>nn :NERDTreeToggle<CR>
" open current file in tree
nmap <Leader>no :NERDTreeFind<CR>



" start nerdtree if no files are selected when running vim
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
" close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" === ChadTree shorcuts === "
" nnoremap <Leader>nn <cmd>CHADopen<cr>
" " clear quickfix list
" nnoremap <Leader>nl <cmd>call setqflist([])<cr>
"
" let g:chadtree_settings = {
      " \"options": {
        " \"lang": "en",
        " \"show_hidden": v:true,
      " \},
      " \"view": {
        " \"window_options": {
          " \"cursorline": v:true,
          " \"foldenable": v:false,
          " \"number": v:false,
          " \"relativenumber": v:false,
          " \"signcolumn": "no",
          " \"winfixwidth": v:false,
          " \"wrap": v:false,
        " \},
      " \},
    " \}


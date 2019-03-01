" strip end of lines and change tabs to spaces
function! Clean()
  let _s=@/
  let l = line('.')
  let c = col('.')
  %s/\t/\ \ /ge
  %s/\s\+$//e
  %s/{\(.\{-}\)}/{ \1 }/g|%s/{  /{ /g|%s/  }/ }/ge
  let @/=_s
  call cursor(l, c)
  set ff=unix
endfunction
nnoremap <Leader>9 :call Clean()<CR>

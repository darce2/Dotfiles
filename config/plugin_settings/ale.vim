" define ale fixers
let g:ale_fixers = {                                                    
\   'javascript': ['eslint', 'prettier', 'prettier-eslint']                
\}
let g:ale_fix_on_save=0                                                 " disable lint on save 
let g:ale_completion_enabled=1                                          " enable completiong where available

" <F8> will run ALEFix 
nmap <F8> <Plug>(ale_fix)                                                  


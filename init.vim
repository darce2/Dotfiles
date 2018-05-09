" Arlen D'Arcy
" arlenjdarcy@gmail.com
" .vimrc
"
"
" top leve settings module
source ~/.config/nvim/config/plugins/general.vim
source ~/.config/nvim/config/settings/general.vim


" file specific
autocmd FileType css source ~/.config/nvim/config/settings/css.vim
autocmd FileType html source ~/.config/nvim/config/settings/html.vim

" Arlen D'Arcy
" arlenjdarcy@gmail.com
" .vimrc
"
"
" top leve settings module
source ~/.config/nvim/config/plugins/general.vim
source ~/.config/nvim/config/settings/general.vim
source ~/.config/nvim/config/settings/colorschemes.vim

" plugin specific settings
source ~/.config/nvim/config/plugin_settings/ale.vim
source ~/.config/nvim/config/plugin_settings/nerdCommenter.vim
source ~/.config/nvim/config/plugin_settings/nerdTree.vim
source ~/.config/nvim/config/plugin_settings/deoplete.vim
source ~/.config/nvim/config/plugin_settings/closetag.vim


" file specific
" autocmd FileType css source ~/.config/nvim/config/settings/css.vim
" autocmd FileType html source ~/.config/nvim/config/settings/html.vim


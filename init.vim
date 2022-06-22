" Arlen D'Arcy
" .vimrc

" top leve settings module
source ~/.config/nvim/config/plugins/general.vim
source ~/.config/nvim/config/settings/general.vim
source ~/.config/nvim/config/settings/colorschemes.vim
source ~/.config/nvim/config/settings/functions.vim

" plugin specific settings
source ~/.config/nvim/config/plugin_settings/bufferline.vim
source ~/.config/nvim/config/plugin_settings/nerdCommenter.vim
source ~/.config/nvim/config/plugin_settings/chadTree.vim
source ~/.config/nvim/config/plugin_settings/gitsigns.vim
source ~/.config/nvim/config/plugin_settings/telescope.vim
source ~/.config/nvim/config/plugin_settings/lsp.vim
source ~/.config/nvim/config/plugin_settings/which-key.vim
source ~/.config/nvim/config/plugin_settings/prettier.vim
source ~/.config/nvim/config/plugin_settings/coq.vim
source ~/.config/nvim/config/plugin_settings/airline.vim

" file specific
autocmd FileType css source ~/.config/nvim/config/settings/css.vim
autocmd FileType html source ~/.config/nvim/config/settings/html.vim


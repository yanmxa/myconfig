# install vim plugin
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


.vimrc
```
call plug#begin()

" molokai theme
Plug 'tomasr/molokai'
let g:molokai_original = 1
let g:rehash256 = 1

call plug#end()

colorscheme molokai     

```

:PlugInstall
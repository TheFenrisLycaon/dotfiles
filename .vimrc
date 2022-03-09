call plug#begin('~/.vim/plugged')



call plug#end


:filetype plugin on
:syntax on
:filetype indent on

set relativenumber
set spell
set incsearch

autocmd FileType python set breakindentopt=shift:4

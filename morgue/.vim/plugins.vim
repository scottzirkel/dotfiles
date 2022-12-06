filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" github
Plugin 'gmarik/vundle'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'sjl/gundo.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
" Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'mattn/gist-vim'
" Plugin 'kana/vim-textobj-user'
" Plugin 'vim-scripts/buftabs'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'chriskempson/base16-vim'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-vinegar'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'file:///Users/scott/.vim/bundle/vim-peepopen'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'mkitt/tabline.vim'
Plugin 'jwalton512/vim-blade'
Plugin 'qpkorr/vim-bufkill'
Plugin 'nathanaelkane/vim-command-w'

" For plugins that trigger errors in older Vims
if v:version >= 704
    Plugin 'SirVer/ultisnips'
endif

call vundle#end()
filetype plugin indent on

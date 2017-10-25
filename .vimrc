set nocompatible

" 画面表示の設定
set clipboard=unnamed
set number
set showmatch
set cursorline
set list
set listchars=tab:▸\ ,eol:$,extends:❯,precedes:❮

" ファイル処理関連の設定
set hidden

" 検索/置換の設定
set hlsearch
set incsearch
set smartcase
set wrapscan

" タブ/インデントの設定
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set autoindent
set smartindent

" カーソル移動関連の設定
set whichwrap=b,s,h,l,<,>,[,]

" Color Scheme
syntax on
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

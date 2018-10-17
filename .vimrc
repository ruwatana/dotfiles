"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.vim')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('dracula/vim')
call dein#add('kchmck/vim-coffee-script')
call dein#add('keith/swift.vim')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

" vim-airline 設定
set laststatus=2 " statusline表示
set showtabline=2 " 常にタブラインを表示
set t_Co=256 " 256色に対応
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='powerlineish' "https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_powerline_fonts = 1


" Vim 設定
syntax on " syntax highlightを有効にする
colorscheme dracula " draculaテーマを有効にする

set encoding=utf-8
set fileencoding=utf-8

set clipboard=unnamed,autoselect " ヤンクでクリップボードにコピー

set backspace=indent,eol,start   " コントロールコード
set whichwrap=b,s,h,l,<,>,[,],~  " 左右のカーソル移動で行を跨いで移動

" set mouse=a        " マウス操作を有効にする
set scrolloff=3    " スクロールの余裕を確保する

set expandtab      " タブの代わりに空白を使う
set tabstop=4      " タブの幅
set shiftwidth=2   " 自動インデントでずれる幅
set softtabstop=0  " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅（デフォルトでは無効: 0）
set autoindent     " 改行時に前の行のインデントを継続する
set smartindent    " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

set ignorecase     " 大文字小文字を無視
set smartcase      " ignorecaseと合わせることで，小文字入力の時のみ大文字小文字を無視
set incsearch      " インクリメンタルサーチ
set hlsearch       " 検索結果をハイライト

set colorcolumn=100 " カラムラインを引く
set number          " 行番号を表示する
set noshowmode      " 左下の-- INSERT --を出なくする

" set spell            " スペルチェック機能
" set spelllang=en,cjk " 日本語を除外

set cursorline      " 現在の行をハイライト

" markdownのハイライトを有効にする
set syntax=markdown
au BufRead,BufNewFile *.md set filetype=markdown

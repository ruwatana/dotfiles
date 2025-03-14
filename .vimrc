call plug#begin('~/.vim/plugged')

Plug 'dylanaraps/wal.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'sheerun/vim-polyglot'

call plug#end()

" fzf
nnoremap <C-p> :Files<CR>    " Ctrl+pでファイル検索
nnoremap <C-g> :Rg<CR>       " Ctrl+gでグレップ検索

" LSP
let g:lsp_diagnostics_enabled = 1         " 診断を有効化
let g:lsp_diagnostics_echo_cursor = 1     " カーソル位置の診断を表示
let g:lsp_diagnostics_float_cursor = 1    " フロート表示を有効化

" Airline
let g:airline_powerline_fonts = 0             " Powerlineフォントを無効化
let g:airline#extensions#tabline#enabled = 1  " タブラインを表示
let g:airline#extensions#branch#enabled = 1   " Gitブランチを表示
let g:airline_theme='onedark'                    " テーマを設定

" 基本設定
set encoding=utf-8                " 文字エンコーディングをUTF-8に設定
set fileencoding=utf-8           " 保存時の文字エンコーディング
set clipboard=unnamed,autoselect " システムのクリップボードと連携
set backspace=indent,eol,start   " バックスペースの動作設定
set whichwrap=b,s,h,l,<,>,[,],~ " カーソル移動で行を跨げるように
set scrolloff=3                  " スクロール時の余白確保

" インデント設定
set expandtab       " タブを空白文字に変換
set tabstop=4       " タブ文字の幅
set shiftwidth=2    " 自動インデントの幅
set softtabstop=0   " タブキーを押したときの幅
set autoindent      " 改行時に前の行のインデントを継続
set smartindent     " 構文に応じて自動でインデント

" 検索設定
set ignorecase      " 大文字小文字を区別しない
set smartcase       " 検索文字に大文字がある場合は区別する
set incsearch       " インクリメンタルサーチを有効化
set hlsearch        " 検索結果をハイライト

" 表示設定
set number          " 行番号を表示
set relativenumber  " 相対行番号を表示
set cursorline      " カーソル行をハイライト
set colorcolumn=100 " 100列目にラインを表示
set signcolumn=yes  " サイン列を常に表示
set noshowmode      " モード表示を無効化
set laststatus=2    " ステータスラインを常に表示
set showtabline=2   " タブラインを常に表示

" キーマッピング
nnoremap <Esc><Esc> :nohlsearch<CR> " ESC連打でハイライト解除

" バッファ操作 - バッファ間の移動を簡単に
nnoremap <silent> [b :bprevious<CR>  " 前のバッファへ
nnoremap <silent> ]b :bnext<CR>      " 次のバッファへ
nnoremap <silent> [B :bfirst<CR>     " 最初のバッファへ
nnoremap <silent> ]B :blast<CR>      " 最後のバッファへ

" 分割ウィンドウの移動 - Ctrl+hjklで移動
nnoremap <C-h> <C-w>h  " 左のウィンドウへ
nnoremap <C-j> <C-w>j  " 下のウィンドウへ
nnoremap <C-k> <C-w>k  " 上のウィンドウへ
nnoremap <C-l> <C-w>l  " 右のウィンドウへ

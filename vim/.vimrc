set nocompatible
" Basic
" not compatible to vi

" Screen
set number        " 行番号表示
set cursorline    " カーソル行強調
set cursorcolumn  " カーソル列強調
set laststatus=2  " ステータスラインを2行表示
"set cmdheigh=2
set showmatch     " 対応する括弧を強調
set list          " 不可視文字表示

" Cursor Movement
set backspace=indent,eol,start " BackSpaceキーの影響範囲設定解除
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ

" Search & Substring
set hlsearch      " 検索結果ハイライト
set incsearch     " インクリメンタルサーチ
set ignorecase    " 大文字小文字を区別しない
set smartcase     " 検索後に大文字小文字が混ざる場合は区別して検索
set wrapscan      " 最後まで検索を終えたら次の検索で先頭から検索する

" Tab & Indent
set expandtab     " タブ入力を複数の空白文字に置き換える
set tabstop=4     " タブ幅
set shiftwidth=4  " 自動インデントの幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーで動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾にあわせて次の行のインデントを決める


" Command Line
set wildmenu wildmode=list:longest,full

" Status Line
set statusline=%F%m%r%h%w\%=[FILETYPE=%Y][ENC=%{&fenc}][%{&ff}]%=%c,\%l/%L

" File
set fileencoding=utf8
set encoding=utf8
set fileformats=unix,dos,mac


" Syntax
syntax enable
syntax on
colorscheme vividchalk
set t_Co=256
highlight CursorLine term=reverse cterm=reverse ctermbg=lightgray guibg=lightgray
highlight CursorColumn term=reverse cterm=reverse ctermbg=lightgray guibg=lightgray


" 
augroup vimrc_set_cursorline_only_active_window
    autocmd!
    autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline cursorcolumn
    autocmd WinLeave * setlocal nocursorline nocursorcolumn
augroup END

" not destroy indent when press enter which line starts with '#'.
inoremap # #

" Key Mapping
nmap <esc><esc> :noh<cr>
augroup quick_fix_cmd_post
    autocmd!
    autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen
augroup END

" Plugin
if filereadable(expand('$HOME/.vim/vimrc.neobundle'))
    source $HOME/.vim/vimrc.neobundle

endif

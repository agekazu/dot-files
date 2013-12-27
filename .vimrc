"<Leader>=" "
let mapleader = " "

"--------------------------------------------------------------------------
"分割ファイル読み込み
"---------------------------------------------------------------------------
".vimrc_plaginがある場合、読み込む
if filereadable(expand('~/.vimrc_plagin'))
  source ~/.vimrc_plagin
endif

".vimrc_commandsがある場合読み込む
if filereadable(expand('~/.vimrc_commands'))
  source ~/.vimrc_commands
endif
"---------------------------------------------------------------------------
"各種設定
"---------------------------------------------------------------------------
filetype plugin indent on "filetype

"autocmd FileType markdown 
autocmd BufNewFile *.rb 0r ~/.vim/template/ruby.rb "rbのテンプレート
autocmd BufNewFile *.py 0r ~/.vim/template/python.py "rbのテンプレート
autocmd BufNewFile *.pl 0r ~/.vim/template/perl.pl "plのテンプレート
autocmd BufNewFile *.sh 0r ~/.vim/template/shell.sh "shのテンプレート
autocmd BufNewFile *.html 0r ~/.vim/template/javascript.html "htmlのテンプレート
autocmd FileType * set tabstop=4
autocmd FileType tex set shiftwidth=2
autocmd FileType tex set tabstop=2
autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html set shiftwidth=2
autocmd BufWritePost *.coffee silent CoffeeMake! -c -b -o js coffee | cwindow | redraw! "CoffeeScriptの設定

"永続的undoを有効にする
set undodir=~/.vim/undo/
set undofile


set highlight=n:Directory
set clipboard+=unnamed
set backupskip=/tmp/*,/private/tmp/* "crontabが使うtmpディレクトリではbackupを行わない
set backupdir=$HOME/.vim/backup
set autoread "ファイルに変更があったら、再読込
set history=200 "検索履歴の上限
set noignorecase "検索時、大文字と小文字区別しない
set smartcase "検索後に大文字小文字が混在しているときは区別する
set hidden "バッファを保存せずとも、他のバッファを表示
set showmatch "対応するカッコの表示
set incsearch "インクリメンタルサーチを常に有効にする
set backspace=indent,eol,start "オートインデント、改行、insertモード開始直後にBSキーで削除できるようにする
set wrap
set nostartofline "移動コマンドを使ったとき、行頭に移動しない
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,ascii
set fileformat=unix
set fileformats=unix,dos,mac
set wildignore=*.o,a.out,*pdf,*git,*hg,*eps,*png

" autocmds

"augroup TeX
"  autocmd!
"  autocmd BufNewFile *.tex setl filetype=tex
"  autocmd BufRead    *.tex setl filetype=tex
"  autocmd FileType tex nnoremap <C-K> :make<CR>
"  set shiftwidth=2 
"augroup END


"---------------------------------------------------------------------------
"レイアウトの設定
"---------------------------------------------------------------------------
set number " 行番号表示
set visualbell " ビープ音の代わりにビジュアルベル(画面フラッシュ)を用いる
set autoindent " オートインデントをセット
set shiftwidth=4 " オートインデントの時インデントする文字数
set expandtab " タブをスペースに置換
set tabstop=4 " タブをスペース2文字分にする
set list 
set listchars=tab:>- " tab可視化
set background=light
let &t_SI = "\e]50;CursorShape=1\x7"
let &t_EI = "\e]50;CursorShape=0\x7"

" ステータスライン
set cmdheight=2 " コマンドラインに使われる画面上の行数。
set laststatus=2 " 常にステータス行を表示
set wildmenu " コマンドライン補完を拡張モードで実行
set showcmd " コマンドを最下層に表示

"---------------------------------------------------------------------------
"Color設定
"---------------------------------------------------------------------------
syntax on
let versdiff_no_resize=1 " バックアップファイルとの比較でウィンドウのサイズを変更する場合は0
highlight Visual term=reverse cterm=reverse ctermbg=7 gui=reverse guifg=black
highlight SpellBad term=bold ctermfg=black "スペルミスの時
highlight linenr ctermfg = lightcyan "行番号の色を変える(色はlightcyan)
highlight Comment ctermfg = 2 "コメントの色
"highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey "ステータスラインの色
highlight Pmenu      ctermbg = grey
highlight PmenuSel   ctermbg = yellow
highlight PMenuSbar  ctermbg = grey
highlight PmenuThumb ctermfg = black

"カーソルのある行を強調表示
"set cursorline 
"highlight CursorLine term=reverse cterm=reverse
"highlight CursorColumn term=reverse cterm=reverse
"全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightred guibg=darkgray
match ZenkakuSpace /　/


"---------------------------------------------------------------------------
"ショートカットキーの設定
"---------------------------------------------------------------------------
"----全モードでのキーリマップ----
map gj <C-w>j
map gk <C-w>k
map gh <C-w>h
map gl <C-w>l


"----ノーマルモードでのキーリマップ----
nnoremap <S-Tab> gt
nnoremap <Tab><Tab> gT
noremap <CR> i<Enter> <ESC>

"gpでペーストしたテキストを再選択できるようにする
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
"ヤンクした文字列でカーソル位置の単語を置換するコマンド
"インデント選択後再度ヴィジュアルモードで選択できるようにする
nnoremap <silent> <silent> ciy ciw<C-r>0<ESC>:let@1<CR>:nohr<CR>

"----インサートモードでのキーリマップ----
inoremap <C-a> <Home>
inoremap <C-e> <End>


"線を描画する短縮入力を定義
inoreabbrev <expr> wla repeat('*',80 - col('.'))
inoreabbrev <expr> wlb repeat('-',80 - col('.'))

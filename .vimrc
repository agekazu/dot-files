".vimrc_plaginがある場合、読み込む
if filereadable(expand('~/dot_files/.vimrc_plagin'))
	source ~/.vimrc_plagin
endif

".vimrc_commandsがある場合読み込む
if filereadable(expand('~/dot_files/.vimrc_commands'))
	source ~/.vimrc_commands
endif

"filetype
filetype plugin indent on
"rubyの時の設定
autocmd FileType ruby set tabstop=2 shiftwidth=2 expandtab

"template
autocmd BufNewFile *.rb 0r ~/.vim/temp/ruby.rb 

"検索時大文字小文字を区別しない。しかし、検索後に大文字小文字が
"混在しているときは区別する
set ignorecase
set smartcase

"オートインデント、改行、insertモード開始直後にBSキーで削除でき
"るようにする
set backspace=indent,eol,start

"オートインデントをセット
set autoindent

"移動コマンドを使ったとき、行頭に移動しない
set nostartofline

"Visualmodeでコピーした内容をクリップボードに貼り付ける
set clipboard=unnamed,autoselect

"ステータスラインを常に表示
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!='?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P'

"バッファが変更されているとき、コマンドをエラーにするのではなく、保存するかどうか尋ねる
set confirm

"ビープ音の代わりにビジュアルベル(画面フラッシュ)を用いる
set visualbell

"全てのモードでマウスを有効化
set mouse=a

"コマンドラインの高さを2行にする
set cmdheight=2

"行番号表示
set number

"キーコードは直ぐにタイムアウト、マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200

"タブをスペース2文字分にする
set tabstop=2
"オートインデントの時インデントする文字数
set shiftwidth=2

"<C-L>で検索後の強調表示をる
nnoremap<C-L> :nohl<CR><C-L>

"tab可視化
set list 
set listchars=tab:>-

"シンタックスハイライトを有効にするため
syntax on

"コメントの色
highlight Comment ctermfg=2

"ステータスラインの色
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey

"カーソルのある行を強調表示
set cursorline 
highlight CursorLine term=reverse cterm=reverse
highlight CursorColumn term=reverse cterm=reverse

"行番号の色を変える(色はlightcyan)
highlight linenr ctermfg = lightcyan

"全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightred guibg=darkgray
match ZenkakuSpace /　/

"インクリメンタルサーチを常に有効にする
set incsearch

" バックアップファイルとの比較でウィンドウのサイズを変更する場合は0
let versdiff_no_resize=1

"swapファイルの出力先を変更
set directory=/tmp
set directory=~/.vim/tmp
set directory=.

"backupファイルの出力先を変更
set backupdir=/vimbackup
set backupdir=~/.vim/vimbackup
set backupdir=.


"----ノーマルモードでのキーリマップ
nnoremap <Space> jzz
nnoremap <S-Space> kzz
nnoremap Y y$
nnoremap <C-a> 0
nnoremap <C-e> $

"gpでペーストしたテキストを再選択できるようにする
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

"ヤンクした文字列でカーソル位置の単語を置換するコマンド
nnoremap <silent> cy ce<C-r>0<ESC>:let@1<CR>:nohr<CR>
nnoremap <silent> <silent> ciy ciw<C-r>0<ESC>:let@1<CR>:nohr<CR>

"日付を挿入する
nnoremap date :r!date<Enter>

"----インサートモードでのキーリマップ
inoremap <C-a> <Home>
inoremap <C-e> <End>

"----ヴィジュアルモードでのキーリマップ
vnoremap <silent> cy c<C-r>0<ESC>:let@1<CR>:nohr<CR>

"インデント選択後再度ヴィジュアルモードで選択できるようにする
vnoremap < <gv
vnoremap > >gv

"線を描画する短縮入力を定義
inoreabbrev <expr> wla repeat('*',80 - col('.'))
inoreabbrev <expr> wlb repeat('-',80 - col('.'))

"pasteモード切り替え
set pastetoggle=<C-p>

"日本語の行の連結時には空白を入力しない。
set formatoptions+=mM


""---------------------------------------------------------------------------
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


autocmd FileType * setlocal formatoptions-=ro "全てのファイルの設定
autocmd FileType ruby set tabstop=2 shiftwidth=2 expandtab "rubyの時の設定
autocmd BufNewFile *.rb 0r ~/.vim/template/ruby.rb "rbのテンプレート
autocmd BufNewFile *.sh 0r ~/.vim/template/shell.sh "shのテンプレート
autocmd BufNewFile *.html 0r ~/.vim/template/javascript.html "shのテンプレート

set tabstop=2 expandtab "tabをスペースに置き換える

set ignorecase "検索時大文字小文字を区別しない。
set smartcase "検索後に大文字小文字が混在しているときは区別する

set incsearch "インクリメンタルサーチを常に有効にする
set backspace=indent,eol,start "オートインデント、改行、insertモード開始直後にBSキーで削除できるようにする


set nostartofline "移動コマンドを使ったとき、行頭に移動しない

set clipboard=unnamed,autoselect "Visualmodeでコピーした内容をクリップボードに貼り付ける
set confirm "バッファが変更されているとき、コマンドをエラーにするのではなく、保存するかどうか尋ねる

set mouse=a "全てのモードでマウスを有効化

"---------------------------------------------------------------------------
"レイアウトの設定
"---------------------------------------------------------------------------
set number "行番号表示
set visualbell "ビープ音の代わりにビジュアルベル(画面フラッシュ)を用いる

set cmdheight=2 "コマンドラインの高さを2行にする

"ステータスラインを常に表示
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

set autoindent "オートインデントをセット
set shiftwidth=2 "オートインデントの時インデントする文字数
nnoremap<C-L> :nohl<CR><C-L> "<C-L>で検索後の強調表示を切る

set tabstop=2 "タブをスペース2文字分にする

"tab可視化
set list 
set listchars=tab:>-

"---------------------------------------------------------------------------
"Color設定
"---------------------------------------------------------------------------
syntax on "シンタックスハイライトを有効にするため

highlight linenr ctermfg = lightcyan "行番号の色を変える(色はlightcyan)
highlight Comment ctermfg = 2 "コメントの色
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey "ステータスラインの色
"カーソルのある行を強調表示
set cursorline 
highlight CursorLine term=reverse cterm=reverse
highlight CursorColumn term=reverse cterm=reverse

"全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightred guibg=darkgray
match ZenkakuSpace /　/

let versdiff_no_resize=1 " バックアップファイルとの比較でウィンドウのサイズを変更する場合は0

"---------------------------------------------------------------------------
"ショートカットキーの設定
"---------------------------------------------------------------------------
"----全モードでのキーリマップ----
map <F5>  :split<C-M>
map <F6>  :bp<C-M>
map <F7>  :bn<C-M>
map <C-j> <C-W>j<C-w>_
map <C-k> <C-W>k<C-w>_
map <C-h> <C-w>h<C-w>_
map <C-l> <C-w>l<C-w>_

"----ノーマルモードでのキーリマップ----
nnoremap Y y$
nnoremap <C-a> 0
nnoremap <C-e> $

"gpでペーストしたテキストを再選択できるようにする
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

"ヤンクした文字列でカーソル位置の単語を置換するコマンド
nnoremap <silent> cy ce<C-r>0<ESC>:let@1<CR>:nohr<CR>
nnoremap <silent> <silent> ciy ciw<C-r>0<ESC>:let@1<CR>:nohr<CR>

nnoremap date :r!date<Enter> "日付を挿入する

"----インサートモードでのキーリマップ----
inoremap <C-a> <Home>
inoremap <C-e> <End>

"----ヴィジュアルモードでのキーリマップ----
vnoremap <silent> cy c<C-r>0<ESC>:let@1<CR>:nohr<CR>

"インデント選択後再度ヴィジュアルモードで選択できるようにする
vnoremap < <gv
vnoremap > >gv

"線を描画する短縮入力を定義
inoreabbrev <expr> wla repeat('*',80 - col('.'))
inoreabbrev <expr> wlb repeat('-',80 - col('.'))

set pastetoggle=<C-p> "pasteモード切り替え

set formatoptions+=mM "日本語の行の連結時には空白を入力しない。

set clipboard=unnamed,autoselect

au BufWritePre /tmp/* setlocal noundofile
        

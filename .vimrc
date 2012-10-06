""-- -----------------------------------------------------------------------
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
autocmd BufWritePost *.coffee silent CoffeeMake! -c -b -o js coffee | cwindow | redraw! "CoffeeScriptの設定
set backupskip=/tmp/*,/private/tmp/* "crontabが使うtmpディレクトリではbackupを行わない
set backupdir=$HOME/.vim/backup
let &directory = &backupdir
set autoread "ファイルに変更があったら、再読込
set history=200 "検索履歴の上限
set ic "検索時、大文字と小文字区別しない
set tabstop=2 expandtab "tabをスペースに置き換える
set smartcase "検索後に大文字小文字が混在しているときは区別する
set incsearch "インクリメンタルサーチを常に有効にする
set backspace=indent,eol,start "オートインデント、改行、insertモード開始直後にBSキーで削除できるようにする
set nostartofline "移動コマンドを使ったとき、行頭に移動しない
set clipboard=unnamed,autoselect "Visualmodeでコピーした内容をクリップボードに貼り付ける
set confirm "バッファが変更されているとき、コマンドをエラーにするのではなく、保存するかどうか尋ねる
set mouse=a "全てのモードでマウスを有効化
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp,sjis,cp932,euc-jp,cp20932

"---------------------------------------------------------------------------
"レイアウトの設定
"---------------------------------------------------------------------------
set number "行番号表示
set visualbell "ビープ音の代わりにビジュアルベル(画面フラッシュ)を用いる
set autoindent "オートインデントをセット
set tabstop=2 "タブをスペース2文字分にする
set shiftwidth=2 "オートインデントの時インデントする文字数
nnoremap<C-L> :nohl<CR><C-L> "<C-L>で検索後の強調表示を切る
"tab可視化
set list 
set listchars=tab:>-

"---------------------------------------------------------------------------
"Color設定
"---------------------------------------------------------------------------
syntax on
let versdiff_no_resize=1 " バックアップファイルとの比較でウィンドウのサイズを変更する場合は0
highlight SpellBad term=bold ctermfg=black "スペルミスの時
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


"---------------------------------------------------------------------------
"ショートカットキーの設定
"---------------------------------------------------------------------------
"----全モードでのキーリマップ----
map gj <C-w>j
map gk <C-w>k
map gh <C-w>h
map gl <C-w>l


"----ノーマルモードでのキーリマップ----
nnoremap > <C-W>3>
nnoremap <  <C-W>3<
nnoremap - <C-W>3-
nnoremap + <C-W>3+
nnoremap ,c <C-W>x
nnoremap <S-Tab> gt
nnoremap <Tab><Tab> gT
for i in range(1, 9)
  execute 'nnoremap <Tab>' . i . ' ' . i . 'gt'
endfor

nnoremap <CR> i<CR><ESC>
nnoremap <C-a> 0
nnoremap <C-e> g$
"gpでペーストしたテキストを再選択できるようにする
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
"ヤンクした文字列でカーソル位置の単語を置換するコマンド
"インデント選択後再度ヴィジュアルモードで選択できるようにする
nnoremap <silent> <silent> ciy ciw<C-r>0<ESC>:let@1<CR>:nohr<CR>
nnoremap <silent> cm :<C-u>checktime<CR>

"----インサートモードでのキーリマップ----
inoremap <C-a> <Home>
inoremap <C-e> <End>

"----ヴィジュアルモードでのキーリマップ----
vnoremap <silent> cy c<C-r>0<ESC>:let@1<CR>:nohr<CR>

"線を描画する短縮入力を定義
inoreabbrev <expr> wla repeat('*',80 - col('.'))
inoreabbrev <expr> wlb repeat('-',80 - col('.'))

set pastetoggle=<C-p> "pasteモード切り替え
set formatoptions+=mM "日本語の行の連結時には空白を入力しない。
au BufWritePre /tmp/* setlocal noundofile

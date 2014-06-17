let mapleader = " "

"--------------------------------------------------------------------------
"分割ファイル読み込み
"---------------------------------------------------------------------------
".vimrc_pluginがある場合、読み込む
if filereadable(expand('~/.vimrc_plugin'))
  source ~/.vimrc_plugin
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
autocmd BufNewFile *.py 0r ~/.vim/template/python.py "pyのテンプレート
autocmd BufNewFile *.pl 0r ~/.vim/template/perl.pl "plのテンプレート
autocmd BufNewFile *.sh 0r ~/.vim/template/shell.sh "shのテンプレート
autocmd BufNewFile *.html 0r ~/.vim/template/javascript.html "htmlのテンプレート
autocmd BufRead,BufNewFile *.md set filetype=markdown


autocmd FileType * set tabstop=4
autocmd filetype html,coffee,javascript,ruby,markdownm,tex,eruby set shiftwidth=2 softtabstop=2 tabstop=2 expandtab

"永続的undoを有効にする
set undodir=~/.vim/undo/
set undofile
set highlight=n:Directory
set clipboard+=unnamed
set autoread                   "ファイルに変更があったら、再読込
set history=200                "検索履歴の上限
set noignorecase               "検索時、大文字と小文字区別しない
set smartcase                  "検索後に大文字小文字が混在しているときは区別する
set hidden                     "バッファを保存せずとも、他のバッファを表示
set showmatch                  "対応するカッコの表示
set incsearch                  "インクリメンタルサーチを常に有効にする
set backspace=indent,eol,start "オートインデント、改行、insertモード開始直後にBSキーで削除できるようにする
set wrap                       "ファイル末尾まで来たら再びファイル先頭へ戻る
set nostartofline              "移動コマンドを使ったとき、行頭に移動しない
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,ascii
set fileformat=unix
set fileformats=unix,dos,mac
set wildignore=*.o,a.out,*pdf,*git,*hg,*eps,*png

"---------------------------------------------------------------------------
" レイアウトの設定
"---------------------------------------------------------------------------
set number " 行番号表示
set visualbell " ビープ音の代わりにビジュアルベル(画面フラッシュ)を用いる
set autoindent " オートインデントをセット
set expandtab
set list 
set listchars=tab:>- " tab可視化

" ステータスライン
set laststatus=2 " 常にステータス行を表示
set wildmenu " コマンドライン補完を拡張モードで実行
set showcmd " コマンドを最下層に表示

"---------------------------------------------------------------------------
" Color設定
"---------------------------------------------------------------------------
syntax on
"let &t_SI = "\e]50;CursorShape=1\x7"
"let &t_EI = "\e]50;CursorShape=0\x7"
set ttimeoutlen=10

" colorscheme
colorscheme default
highlight Visual term=reverse cterm=reverse ctermbg=7 gui=reverse guifg=lightcyan
highlight SpellBad term=bold ctermfg=black " スペルミスの時
highlight linenr ctermfg = lightcyan " 行番号の色を変える
highlight Comment ctermfg = 35" コメントの色
highlight Pmenu      ctermbg = blue
highlight PmenuSel   ctermbg = green
highlight PMenuSbar  ctermbg = cyan
highlight PmenuThumb ctermfg = cyan

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightred guibg=darkgray
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
" 行末の半角スペースの表示
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces guibg=darkgray ctermbg=Lightred
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

"---------------------------------------------------------------------------
" ショートカットキーの設定
"---------------------------------------------------------------------------

"----ノーマルモードでのキーリマップ----
nnoremap <S-Tab> gt
nnoremap <Tab><Tab> gT
" ヤンクした文字列でカーソル位置の単語を置換するコマンド
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy   c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

"----インサートモードでのキーリマップ----
inoremap <C-a> <Home>
inoremap <C-e> <End>


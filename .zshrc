#補完機能を有効化
autoload -U compinit
compinit

#コマンド履歴を記憶
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt auto_pushd #移動したディレクトリを記憶
setopt correct #近いコマンドを補正
setopt hist_ignore_dups #同じコマンドを記憶しない
setopt pushd_ignore_dups #同じディレクトリをpushしない
setopt list_packed #入力候補を詰めて表示
setopt extended_glob #拡張表記を可能にする

#vimライクなキーバインド
#bindkey -v

#rvm pass
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export PATH=$PATH/usr/local/Cellar/ruby/1.9.3-p0/bin:
#export PATH=/usr/sfw/bin:$PATH
export PATH=$PATH:$HOME/flex_sdk_4.6/bin
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH
export NODE_PATH=$HOME/.node_libraries:$PATH
export PATH=$HOME/bin:$PATH
export MANPATH=$HOME/share/man:$MANPATH
export GISTY_DIR=$HOME/Program/gisty

#test -f ~/.vvm/etc/login && source ~/.vvm/etc/login

alias ls="ls -G"
alias jm='jman'
alias slvim="vim -c \"normal '0\""
alias robocode='cd robocode ; ./robocode.sh'
alias py='python'
alias s.z='source ~/.zshrc'
alias vv='vim ~/.vimrc'
alias vp='vim ~/.vimrc_plagin'
alias vc='vim ~/.vimrc_commands'
alias z='vim ~/.zshrc'
alias javac='javac -J-Dfile.encoding=UTF8'
alias java='java -Dfile.encoding=UTF8'
alias zen='~/Dropbox/2年前期'
alias ji='cd /Users/e115703/Dropbox/2年前期/実験I/'
alias ka='/Users/e115703/Dropbox/2年前期/確率及び統計/'
alias pd='/Users/e115703/Dropbox/2年前期/PDII/'
alias vt='vim *tex'
alias gls="gls --color"
#言語設定
export LANG=ja_JP.UTF-8
export JLESSCHARSET=japanese-utf-8

case ${UID} in
  0)
    PROMPT="%B%{[31m%}%/#%{[m%}%b "
    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
    SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{[37m%}${HOST%%.*} ${PROMPT} "
    ;;
  *)
    PROMPT="%{[32m%}%// %%%{[m%} "
    PROMPT2="%{[32m%}%_%%%{[m%} "
    SPROMPT="%{[33m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{[37m%}${HOST%%.*} ${PROMPT} "
    ;;
esac

#ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="eastwood"
#plugins=(git)
#source $ZSH/oh-my-zsh.sh

unset LANG
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'


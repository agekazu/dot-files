# -*- mode:shell-script -*-
#補完機能を有効化
autoload -U compinit
compinit

#コマンド履歴を記憶
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

source ~/perl5/perlbrew/etc/bashrc
source $ZDOTDIR/.zaliases


setopt correct #近いコマンドを補正
setopt hist_ignore_dups #同じコマンドを記憶しない
setopt list_packed #入力候補を詰めて表示
setopt extended_glob #拡張表記を可能にする
setopt auto_param_slash

export RSENSE_HOME=/usr/local/Cellar/rsense/0.3/libexec
export RBENV_ROOT=$HOME/.rbenv/
eval "$(rbenv init -)"
#言語設定
export GDFONTPATH=/Library/Fonts/
export RUBYLIB=$HOME/
export LANG=ja_JP.UTF-8
export _Z_DATA=$HOME/.zfiles/.z
export RUBYLIB=.:$RUBYLIB
export PATH=/usr/local/pdflib/bin:/opt/local/bin:/opt/local/sbin:/usr/local/sbin:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH
export NODE_PATH=$HOME/.node_libraries:$PATH
export EDITOR=vim
export LS_COLORS='di=35:ln=35:so=32:pi=33:ex=31:bd=32;34:cd=32;34:su=41;30:sg=46;30:tw=42;30:ow=42;30'
 export LESSCHARSET=utf-8
 export CLASSPATH='.:/Library/Java/JavaVirtualMachines/jdk1.7.0_07.jdk/Contents/Home/jre/lib/jfxrt.jar'
 export TEXINPUTS='./sty:$HOME/myinputs//:'
export YOMITANSSH='ssh://e115703@yomitan.ie.u-ryukyu.ac.jp//home/hg/y11/e115703/software'
export GNUTERM='x11'
export JPF=$HOME/Documents/jpf-core/bin/jpf

zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:*files' ignored-patterns '*?.class' '*?.o' '*?~' '*\#' '*?\*' 
zstyle ':completion:*' group-name ''

# 今いるディレクトリを補完候補から外す
zstyle ':completion:*' ignore-parents parent pwd ..


#z.sh
. `brew --prefix`/etc/profile.d/z.sh
  function precmd () {
   _z --add "$(pwd -P)"
  }

# プロンプト
# case ${UID} in
#   0)
#     PROMPT="%B%{[31m%}%/#%{[m%}%b "
#     PROMPT2="%B%{[31m%}%_#%{[m%}%b "
#     SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
#     [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#     PROMPT="%{[37m%}${HOST%%.*} ${PROMPT} "
#     ;;
#   *)
#     PROMPT="%{[32m%}[%~] %%%{[m%} "
#     PROMPT2="%{[32m%}%_%%%{[m%} "
#     SPROMPT="%{[33m%}%r is correct? [n,y,a,e]:%{[m%} "
#     [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#     PROMPT="%{[37m%}${HOST%%.*} ${PROMPT} "
#     ;;
# esac

PROMPT='%F{black}[%m]%%%f '
RPROMPT='%F{cyan}[%~]%f'

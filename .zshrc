# -*- mode:shell-script -*-
#補完機能を有効化
autoload -U compinit
compinit
# dirをpush
setopt auto_pushd

#コマンド履歴を記憶
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

bindkey -e

source ~/perl5/perlbrew/etc/bashrc
source $ZDOTDIR/.zaliases

setopt correct #近いコマンドを補正
setopt hist_ignore_dups #同じコマンドを記憶しない
setopt list_packed #入力候補を詰めて表示
setopt extended_glob #拡張表記を可能にする
setopt auto_param_slash

export PGDATA=/usr/local/var/postgres
export GDFONTPATH=/usr/share/fonts/liberation
export GNUPLOT_DEFAULT_GDFONT=Verdana
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
#言語設定
export LANG=ja_JP.UTF-8
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
export JAVA_HOME='/Library/Java/Home'
export HADOOP_HOME='/usr/local/Cellar/hadoop/1.1.2/libexec'
export GNUTERM='x11'
export JPF=$HOME/Documents/jpf-core/bin/jpf
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
export PYTHONSTARTUP=$HOME/.pythonrc.py python
export PYTHON

#export DYLD_LIBRARY_PATH=/usr/local/lib

zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:*files' ignored-patterns '*?.class' '*?.o' '*?~' '*\#' '*?\*' 
zstyle ':completion:*' group-name ''

# 今いるディレクトリを補完候補から外す
zstyle ':completion:*' ignore-parents parent pwd ..

export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi

# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
RPROMPT="%F{cyan}[%~]%f%1(v|%F{green}%1v%f|)"
PROMPT='%F{black}%%%f '

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
alias rake="noglob rake"

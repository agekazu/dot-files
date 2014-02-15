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

setopt correct #近いコマンドを補正
setopt hist_ignore_dups #同じコマンドを記憶しない
setopt list_packed #入力候補を詰めて表示
setopt extended_glob #拡張表記を可能にする
setopt auto_param_slash

zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:*files' ignored-patterns '*?.class' '*?.o' '*?~' '*\#' '*?\*' 
zstyle ':completion:*' group-name ''


# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' actionformats '(%b|%a)'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
PROMPT='%F{white}%%%f '
RPROMPT="%f%1(v|%F{green}%1v%f|)%F{cyan}[%~]"

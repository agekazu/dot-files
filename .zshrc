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
#eval "$(rbenv init -)"

#rvm pass
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
#export PATH=$PATH/usr/local/Cellar/ruby/1.9.3-p0/bin:
##export PATH=/usr/sfw/bin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/sbin:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH
export NODE_PATH=$HOME/.node_libraries:$PATH
export MANPATH=$HOME/share/man:$MANPATH
export PAGER=/usr/bin/less
export EDITOR=vim
export LESSCHARSET=utf-8
export LV='-la -Ou8'

alias rbenv='nocorrect rbenv'
alias less='/usr/bin/less -MN'
alias ls="ls -Gv"
alias zz='vim ~/.zshrc'
alias s.z='source ~/.zshrc'
alias vv='vim ~/.vimrc'
alias vp='vim ~/.vimrc_plagin'
alias vc='vim ~/.vimrc_commands'
alias vz='vim ~/.zshrc'
alias javac='javac -J-Dfile.encoding=UTF8'
alias java='java -Dfile.encoding=UTF8'
alias ji='cd /Users/e115703/Dropbox/2年後期/実験II'
alias mo='cd /Users/e115703/Dropbox/2年後期/モデリングと設計'
alias os='cd /Users/e115703/Dropbox/2年後期/OS'
alias vt='vim *tex'
alias gls="gls --color"
alias tt="mytex *tex"
alias ot="openpdfMytex *tex"
alias dt="dontopenMytex *tex"
alias ...="cd ../.."
alias ....="cd ../../.."
alias cwo="coffee -c -w -o js coffee"

 . `brew --prefix`/etc/profile.d/z.sh
  function precmd () {
   z --add "$(pwd -P)"
  }


#言語設定
export LANG=ja_JP.UTF-8

PROMPT="% "
# プロンプト
#case ${UID} in
#  0)
#    PROMPT="%B%{[31m%}%/#%{[m%}%b "
#    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
#    SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
#    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#    PROMPT="%{[37m%}${HOST%%.*} ${PROMPT} "
#    ;;
#  *)
#    PROMPT="%{[32m%}[%~] %%%{[m%} "
#    PROMPT2="%{[32m%}%_%%%{[m%} "
#    SPROMPT="%{[33m%}%r is correct? [n,y,a,e]:%{[m%} "
#    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#    PROMPT="%{[37m%}${HOST%%.*} ${PROMPT} "
#    ;;
#esac

#ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="eastwood"
#plugins=(git)
#source $ZSH/oh-my-zsh.sh

unset LANG
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export RSENSE_HOME=$HOME/lib/rsense-3.0
zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#Ruby1.9.2からLOAD_PATHにカレントディレクトリがなくなったため追加
export RUBYLIB=.:$RUBYLIB

# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# 自動ls
function cd() { builtin cd $@ && ls;}
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc" 


autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git 

# 下のformatsの値をそれぞれの変数に入れてくれる機能の、変数の数の最大。
# デフォルトだと2くらいなので、指定しておかないと、下のformatsがほぼ動かない。
zstyle ':vcs_info:*' max-exports 7

# 左から順番に、vcs_info_msg_{n}_ という名前の変数に格納されるので、下で利用する
zstyle ':vcs_info:*' formats '%R' '%S' '%b' '%s'
# 状態が特殊な場合のformats
zstyle ':vcs_info:*' actionformats '%R' '%S' '%b|%a' '%s'

# 4.3.10以上の場合は、check-for-changesという機能を使う。
autoload -Uz is-at-least
if is-at-least 4.3.10; then
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' formats '%R' '%S' '%b' '%s' '%c' '%u'
    zstyle ':vcs_info:*' actionformats '%R' '%S' '%b|%a' '%s' '%c' '%u'
fi

# zshのPTOMPTに渡す文字列は、可読性がそんなに良くなくて、読み書きしたり、つまりデバッグが
# 大変なため、文字列を組み立てるのは関数でやることにする。
# そのほうが分岐などを追加するのが楽。
# この先、追加で表示させたい情報はいろいろでてくるとおもうし。
function echo_rprompt () {
    local repos branch st color

    STY= LANG=en_US.UTF-8 vcs_info
    if [[ -n "$vcs_info_msg_1_" ]]; then
        # -Dつけて、~とかに変換
        repos=`print -nD "$vcs_info_msg_0_"`

        # if [[ -n "$vcs_info_msg_2_" ]]; then
            branch="$vcs_info_msg_2_"
        # else
        #     branch=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
        # fi

        if [[ -n "$vcs_info_msg_4_" ]]; then # staged
            branch="%F{green}$branch%f"
        elif [[ -n "$vcs_info_msg_5_" ]]; then # unstaged
            branch="%F{red}$branch%f"
        else
            branch="%F{blue}$branch%f"
        fi

        print -n "[%25<..<"
        print -n "%F{yellow}$vcs_info_msg_1_%f"
        print -n "%<<]"

        print -n "[%15<..<"
        print -nD "%F{yellow}$repos%f"
        print -n "@$branch"
        print -n "%<<]"

    else
        print -nD "[%F{yellow}%60<..<%~%<<%f]"
    fi
}

setopt prompt_subst
RPROMPT='`echo_rprompt`'


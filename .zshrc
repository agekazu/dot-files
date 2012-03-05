autoload -U compinit

setopt auto_pushd
export PATH=/usr/local/Cellar/ruby/1.9.3-p0/bin:$PATH
export PATH=/usr/local/bin:$PATH
alias  ca='cd Algorithm'
alias slvim="vim -c \"normal '0\""
alias  robocode='cd robocode ; ./robocode.sh'
alias  cp='cd programming2'
alias  py='python'
alias s.z='source ~/.zshrc'
alias v='vim ~/.vimrc'
alias z='vim ~/.zshrc'
alias javac='javac -J-Dfile.encoding=UTF8'
alias java='java -Dfile.encoding=UTF8'

#言語設定
export LANG=ja_JP.UTF-8

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="eastwood"
plugins=(git)
source $ZSH/oh-my-zsh.sh

## cd 時に自動で push
setopt auto_pushd
## 同じディレクトリを pushd しない
setopt pushd_ignore_dups

# antigen
source /usr/local/share/antigen/antigen.zsh

# oh-my-zsh
antigen use oh-my-zsh

# theme
antigen theme agnoster

# plugin
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle command-not-found
antigen bundle extract
antigen bundle pip
antigen bundle pyenv
antigen bundle z
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# apply
antigen apply

# config
DEFAULT_USER="$USER"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

# pip zsh completion
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip

# alias
alias ll="ls -ahl"
alias rm="rm -i"
alias update_all="mas outdated && brew update && brew outdated && brew cask outdated --greedy"
alias upgrade_all="mas upgrade && brew upgrade && brew cu -ay"
alias backup_all="cp -r ~/.zshrc ~/.vimrc ~/.aria2 ~/.pylintrc ~/Projects/dot_file"

# LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"

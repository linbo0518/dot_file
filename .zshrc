# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# antigen
source /usr/local/share/antigen/antigen.zsh

# oh-my-zsh
antigen use oh-my-zsh

# theme
antigen theme romkatv/powerlevel10k

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
alias update_all="mas outdated && brew update && brew outdated && brew outdated --cask --greedy"
alias upgrade_all="mas upgrade && brew upgrade && brew upgrade --cask"
alias backup_all="cp -r ~/.zshrc ~/Projects/dot_file && brew bundle dump && mv ./Brewfile ~/Projects/dot_file"
alias set_proxy="export ALL_PROXY=http://127.0.0.1:1087"
alias unset_proxy="unset ALL_PROXY"

# Proxy
export ALL_PROXY=http://127.0.0.1:1087

# LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

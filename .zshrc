# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# variable
BACKUP_DIR="${HOME}/Projects/dot_file"
PROXY_PATH="http://127.0.0.1:7890"

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
antigen bundle pyenv
antigen bundle rust
antigen bundle z
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-apple-touchbar

# apply
antigen apply

# config
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
alias update_all="brew update -v && brew outdated -v --greedy"
alias upgrade_all="brew upgrade && brew cu -ayc"
alias backup_all="cp ~/.zshrc ~/.vimrc ~/.zprofile ~/.tmux.conf ~/.tmux.conf.local $BACKUP_DIR && brew bundle dump -f --file $BACKUP_DIR/Brewfile"
alias proxy_on="export http_proxy=${PROXY_PATH}; export https_proxy=${PROXY_PATH}; export all_proxy=${PROXY_PATH}"
alias proxy_off="unset http_proxy https_proxy all_proxy"

# homebrew sbin
export PATH="/usr/local/sbin:$PATH"

# homebrew
export HOMEBREW_GITHUB_API_TOKEN=paste_token_here

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

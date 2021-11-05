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
antigen bundle pyenv
antigen bundle z
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

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

# path variable
BACKUP_DIR="~/Projects/dot_file"

# alias
alias ll="ls -ahl"
alias rm="rm -i"
alias update_all="brew update -v && brew outdated -v --greedy"
alias upgrade_all="brew upgrade && brew cu -ayc"
alias backup_all="cp ~/.zshrc ~/.vimrc ~/.zprofile ~/.tmux.conf ~/.tmux.conf.local $BACKUP_DIR && brew bundle dump -f --file $BACKUP_DIR/Brewfile && pip freeze > $BACKUP_DIR/requirements.txt"
alias set_proxy="export ALL_PROXY=http://127.0.0.1:1087"
alias unset_proxy="unset ALL_PROXY"

# homebrew sbin
export PATH="/usr/local/sbin:$PATH"

# homebrew
export HOMEBREW_GITHUB_API_TOKEN=token_paste_here

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

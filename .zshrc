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
BREW_BOTTLE_DIR="/usr/local/opt"

# alias
alias ll="ls -ahl"
alias rm="rm -i"
alias update_all="mas outdated && brew update -v && brew outdated -v --greedy"
alias upgrade_all="mas upgrade && brew upgrade && brew cu -ayc"
alias backup_all="cp ~/.zshrc $BACKUP_DIR && brew bundle dump -f --file $BACKUP_DIR/Brewfile && pip freeze > $BACKUP_DIR/requirements.txt"
alias set_proxy="export ALL_PROXY=http://127.0.0.1:1087"
alias unset_proxy="unset ALL_PROXY"

# proxy
export ALL_PROXY=http://127.0.0.1:1087

# homebrew sbin
export PATH="/usr/local/sbin:$PATH"

# # compile flags 
# export LDFLAGS=""
# export CPPFLAGS=""
# export LDFLAGS="-L$BREW_BOTTLE_DIR/zlib/lib $LDFLAGS"
# export CPPFLAGS="-I$BREW_BOTTLE_DIR/zlib/include $CPPFLAGS"
# export LDFLAGS="-L$BREW_BOTTLE_DIR/bzip2/lib $LDFLAGS"
# export CPPFLAGS="-I$BREW_BOTTLE_DIR/bzip2/include $CPPFLAGS"

# homebrew
export HOMEBREW_GITHUB_API_TOKEN=8e1abd96cfa1a662bf0436e57d00dca25027cbd9

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

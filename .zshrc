export ZSH=$HOME/.oh-my-zsh # Should always be first!!!
PATH=$PATH:/usr/local/bin; export PATH
DEFAULT_USER=whoami

plugins=(git zsh-autosuggestions rails zsh-nvm)
ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Base16 Shell (keep here for color to work in 256 in shell & vim)
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
  eval "$("$BASE16_SHELL/profile_helper.sh")"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Disable flow control commands (keeps C-s from freezing everything)
# stty start undef
# stty stop '' -ixoff

#FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# EXPORTS
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

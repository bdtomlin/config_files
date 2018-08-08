#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

alias :q='exit'
alias v='nvim'
alias vim='nvim'

# enable my bins
export PATH="$HOME/bin:$PATH"

# allow local ./bin
export PATH="./bin:$PATH"

# turn off autocorrect
unsetopt CORRECT

# make neovim the default editor
export EDITOR='nvim'
export VISUAL='nvim'

# rbenv
eval "$(rbenv init -)"

# iex readline (rlwrap)
alias iex='rlwrap -a dummyarg iex'

# gcloud
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/google-cloud-sdk/path.zsh.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# for crystal compiler
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

#flutter
export PATH="$HOME/dev/tools/flutter/bin:$PATH"

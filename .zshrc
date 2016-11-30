#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

for file in ~/.{aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

#I added this, but not sure if I need it...
export TERM=xterm-256color

# Customize to your needs...
#
#export PATH="/Applications/MAMP/bin/php/php5.5.3/bin:$PATH"
#export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
# export PATH="$HOME/.rbenv/bin:$PATH"
# export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/shell-scripts:$PATH"
export PATH="/usr/local/sbin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.npm-packages/bin"
#export PATH="$PATH:$HOME/.composer/vendor/bin"


export PATH="$PATH:$HOME/.composer/vendor/bin"

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
NPM_PACKAGES=/Users/scott/.npm-packages
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"
export PATH="$PATH:$HOME/spark-installer"
export PATH="$HOME/.themekit:$PATH"

setopt NO_glob_assign

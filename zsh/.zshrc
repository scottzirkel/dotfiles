if [ -f $HOME/Dropbox/dotfiles/.config/exercism/exercism_completion.zsh ]; then
  . $HOME/Dropbox/dotfiles/.config/exercism/exercism_completion.zsh
fi

for file in $HOME/dotfiles/.{aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

#I added this, but not sure if I need it...
# export TERM=xterm-256color

export PATH="$PATH:$HOME/.npm-packages/bin"

export PATH="$PATH:$HOME/bin"

export PATH="$PATH:$HOME/.composer/vendor/bin"

export COMPOSER_DISABLE_XDEBUG_WARN=1

export PGDATA=/usr/local/var/postgres

export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH
#export PATH="$PATH:$HOME/.n/bin/node/bin"
#export PATH="$PATH:$HOME/.n/bin/npm/bin"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
#NPM_PACKAGES=/Users/scott/.npm-packages
#NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
#PATH="$NPM_PACKAGES/bin:$PATH"
#setopt NO_glob_assign

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fpath=($fpath "/Users/scott/.zfunctions")

eval "$(starship init zsh)"

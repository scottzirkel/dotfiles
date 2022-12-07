if [ -f $HOME/Dropbox/dotfiles/.config/exercism/exercism_completion.zsh ]; then
  . $HOME/Dropbox/dotfiles/.config/exercism/exercism_completion.zsh
fi

#--------------------------------------------------------------------------------
# Oh My Zsh
#--------------------------------------------------------------------------------

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
ZSH_CUSTOM=$HOME/.config/zsh
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
    artisan
    npm
    composer
    cp
    dnf
    docker
    docker-compose
    git
    httpie
    rsync
    tmux
    z
)

source $ZSH/oh-my-zsh.sh

#--------------------------------------------------------------------------------
# Configuration
#--------------------------------------------------------------------------------

export KEYTIMEOUT=15

typeset -U path cdpath fpath
path=(
    $HOME/.local/bin
    $HOME/.config/composer/vendor/bin
    $HOME/.n/bin
    $HOME/.npm-packages/bin
    ./vendor/bin
    $path
)

setopt auto_cd
cdpath=(
    $HOME/code
)

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format %d
zstyle ':completion:*:descriptions' format %B%d%b
zstyle ':completion:*:complete:(cd|pushd):*' tag-order \
    'local-directories named-directories'

export EDITOR=vim
export GIT_EDITOR=vim
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export ARTISAN_OPEN_ON_MAKE_EDITOR=nvr
export FZF_DEFAULT_COMMAND='ag -u -g ""'

unsetopt sharehistory

#--------------------------------------------------------------------------------
# Miscellaneous
#--------------------------------------------------------------------------------

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
    OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
    zle -N self-insert url-quote-magic
}

pastefinish() {
    zle -N self-insert $OLD_SELF_INSERT
}

zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic pasate-finish pastefinish
### Fix slowness of pastes

#export PATH="$PATH:$HOME/.npm-packages/bin"
#export PATH="$PATH:$HOME/bin"
#export PATH="$PATH:$HOME/.composer/vendor/bin"

export PGDATA=/usr/local/var/postgres
export COMPOSER_DISABLE_XDEBUG_WARN=1

#export N_PREFIX=$HOME/.n
#export PATH=$N_PREFIX/bin:$PATH
#export PATH="$PATH:$HOME/.n/bin/node/bin"
#export PATH="$PATH:$HOME/.n/bin/npm/bin"

#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
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

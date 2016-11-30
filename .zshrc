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
    print "$file"
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

alias vi="mvim -v"
alias vim="mvim -g"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias artisan="php artisan"
alias art="php artisan"
alias artdump="artisan dump-autoload"
alias compdump="composer dump-autoload"
alias fulldump="artdump && compdump"
alias tinker="artisan tinker"
alias homestead="php vendor/bin/homestead"
alias gs="git status"
alias gc="git commit -a -m"
alias rocketeer="php rocketeer.phar"
alias server="php -S 127.0.0.1:5220"
alias tagnet="ssh tagnetdev@70.32.76.228"
alias hosts="sudo vi /etc/hosts"
alias phpunit="vendor/bin/phpunit"
alias please="php please"

# function mkcd {
#     if [ ! -n "$1" ]; then
#         echo "Enter a directory name"
#     elif [ -d $1 ]; then
#         echo "\`$1' already exists"
#     else
#         mkdir $1 && cd $1
#     fi
# }

alias docs='cd ~/Documents'
alias dl='cd ~/Downloads'
alias sb='cd ~/Development/sandbox'
alias dev='cd ~/Development'

alias startphp='brew services start php70'
alias stopphp='brew services stop php70'
alias restartphp='brew services restart php70'
#alias startapache='brew services start httpd24'
#alias stopapache='brew services stop httpd24'
#alias restartapache='brew services restart httpd24'
alias startapache='sudo apachectl start'
alias stopapache='sudo apachectl stop'
alias restartapache='sudo apachectl -k restart'
alias startmysql='brew servivces start mysql'
alias stopmysql='brew services stop mysql'
alias restartmysql='brew services restart mysql'
alias startmongo='brew services start mongodb'
alias stopmongo='brew services stop mongodb'
alias restartmongo='brew services restart mongodb'
alias dnsmasqstart='brew services start dnsmasq'
alias dnsmasqstop='brew services stop dnsmasq'
alias dnsmasqrestart='brew services restart dnsmasq'

alias wordpress='~/.custom/install-wp.sh'

alias brewu='brew update && brew upgrade && brew cleanup && brew prune && brew doctor'

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

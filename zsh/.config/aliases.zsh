# GIT
alias g="git"
alias gs="git status"
alias gc="git commit"
alias gco="git checkout"
alias gcob="git checkout -b"
alias nah='git reset --hard && git clean -df'
alias wip='git add . && git commit -am "wip"'
alias pushwip="wip && git push"

# PHP
alias artisan="php artisan"
alias art="php artisan"
alias a="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias refresh="php artisan migrate:refresh --seed"
alias stan="vendor/bin/phpstan analyse"
alias tna="php artisan test && ./vendor/bin/phpstan analyse --xdebug"
alias compdump="composer dump-autoload"
alias tinker="artisan tinker"
alias homestead="php vendor/bin/homestead"
alias rocketeer="php rocketeer.phar"
alias please="php please"
alias composer='COMPOSER_MEMORY_LIMIT=-1 composer'
alias cr='composer require'
alias co='composer outdated --direct'
alias ci='composer install'
alias ct='composer test'
alias cl='composer lint'
alias ca='composer analyse'
alias clearphplog="rm -rf /opt/homebrew/var/log/php-fpm.log"

# Stupid
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy";
alias fight="echo '(ง'̀-'́)ง' | pbcopy";

# MISC
alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'

alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"

alias hosts="sudo vi /etc/hosts"
alias docs='cd ~/Documents'
alias dl='cd ~/Downloads'
alias storm='phpstorm'

# Directories
alias ll='ls -FGlAhp'
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"

alias reload='source ~/.zshrc'
alias vi=nvim
alias vim=nvim

alias brewu='brew update && brew upgrade && brew cleanup && brew doctor'
alias update="npm update --location=global && composer global update && brewu"

alias killdsstore="find . -name '.DS_Store' -type f -delete"

alias jigsaw='./vendor/bin/jigsaw'

alias rebuilddb='rm -rf database/database.sqlite && touch database/database.sqlite && art migrate'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Flush Directory Service cache
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

#NPM
alias dev='npm run dev'
alias watch='npm run watch'
alias prod='npm run prod'

alias pn='pnpm'

alias sshconfig="vi ~/.ssh/config"

alias optimizejpg="/Applications/ImageOptim.app/Contents/MacOS/ImageOptim *.jpg *.JPG"
alias optimize="find . -name '*.jpg' -print0 -or -name '*.JPG' -print0 -or -name '*.JPEG' -print0 -or -name '*.png' -print0 -or -name '*.gif' -print0 | xargs -0 -L 100 /Applications/ImageOptim.app/Contents/MacOS/ImageOptim"

# alias git=hub
# alias vapor=vendor/bin/vapor

alias pint='./vendor/bin/pint'

alias sail='./vendor/bin/sail'
alias sailor='sail art'

alias switch80='valet use php80 && composer global update'
alias switch81='valet use php81 && composer global update'
alias switch74='valet use php74 && composer global update'

# GIT
alias g="git"
alias gs="git status"
alias gc="git commit"
alias gco="git checkout"
alias gcob="git checkout -b"
alias nah='git reset --hard && git clean -df'
alias wip='git add . && git commit -am "wip"'
alias pushwip="wip && git push"

# LAZYGIT
alias lg="lazygit"
alias lgs="lazygit status"
alias lgd="lazygit --path=~/.dotfiles"

# PHP
# alias artisan="herd php artisan"
alias art="herd php artisan"
alias a="herd php artisan"
alias fresh="herd php artisan migrate:fresh --seed"
alias refresh="herd php artisan migrate:refresh --seed"
alias stan="./vendor/bin/phpstan analyse"
alias tna="herd php artisan test && ./vendor/bin/phpstan analyse --xdebug"
alias compdump="herd composer dump-autoload"
# alias tinker="herd php artisan tinker"
# alias horizon="herd php artisan horizon"
alias envoy='php vendor/bin/envoy'
alias rocketeer="php rocketeer.phar"
alias please="php please"
alias clearphplog="rm -rf /opt/homebrew/var/log/php-fpm.log"

alias env-pull='npx dotenv-vault pull'
alias env-push='npx dotenv-vault push'
alias env-login='npx dotenv-vault login'

# Composer
alias composer='COMPOSER_MEMORY_LIMIT=-1 herd composer'
alias cr='composer require'
alias co='composer outdated --direct'
alias ci='composer install'
alias ct='composer test'
alias cl='composer lint'
alias ca='composer analyse'

# Sail
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
alias sa='sail artisan'

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

# Sail NPM
alias snpm="sail npm"
alias dev='snpm run dev'
alias build='snpm run build'

alias pn='pnpm'

alias sshconfig="vi ~/.ssh/config"

alias optimizejpg="/Applications/ImageOptim.app/Contents/MacOS/ImageOptim *.jpg *.JPG"
alias optimize="find . -name '*.jpg' -print0 -or -name '*.JPG' -print0 -or -name '*.JPEG' -print0 -or -name '*.png' -print0 -or -name '*.gif' -print0 | xargs -0 -L 100 /Applications/ImageOptim.app/Contents/MacOS/ImageOptim"

alias keka="/Applications/Keka.app/Contents/MacOS/Keka --cli"
alias 7zip="keka --client 7z"

# alias git=hub
# alias vapor=vendor/bin/vapor

alias pint='./vendor/bin/pint'

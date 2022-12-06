# Artisan Commands
# 
_artisan_get_command_list () {
	php artisan --no-ansi | sed "1,/Available commands/d" | awk '/^ +[a-z]+/ { print $1 }'
}

_artisan () {
  if [ -f artisan ]; then
    compadd `_artisan_get_command_list`
  fi
}

compdef _artisan artisan
compdef _artisan art


alias art='php artisan'
alias artdown='php artisan down'
alias artup='php artisan up'
alias artopimize='php artisan optimize'
alias artserve='php artisan serve'
alias artmigrate='php artisan migrate'
alias artkey='php artisan key:generate'
alias artauth='php artisan make:auth'
alias arttinker='php artisan tinker'
alias artcache='php artisan cache:clear'
alias artclear='php artisan clear-compiled'
alias artpublish='php artisan vendor:publish'
alias artroutes='php artisan route:list'
alias artmigration='php artisan make:migration'
alias artmodel='php artisan make:model'
alias artcommand='php artisan make:command'
alias artmail='php artisan make:mail'
alias artseeder='php artisan make:seeder'
alias arttest='php artisan make:test'
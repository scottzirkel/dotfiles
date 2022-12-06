#  Artisan plugin  #

Artisan Commands for Oh My Zsh

##  Description  ##


##  Usage  ##

This plugin supplies multiple commands, all commands starts with `art`. 
Example use:

```
art make:migration ExampleMail
```


| Command      | For |
|------------------|----------|
| art | 'php artisan' |
| artdown | 'php artisan down' |
| artup | 'php artisan down' |
| artopimize | 'php artisan optimize' |
| artserve | 'php artisan serve' |
| artmigrate | 'php artisan migrate' |
| artkey | 'php artisan key:generate' |
| artauth | 'php artisan make:auth' |
| arttinker | 'php artisan tinker' |
| artcache | 'php artisan cache:clear' |
| artclear | 'php artisan clear-compiled' |
| artpublish | 'php artisan vendor:publish' |
| artroutes | 'php artisan route:list' |
| artmigration | 'php artisan make:migration' |
| artmodel | 'php artisan make:model' |
| artcommand | 'php artisan make:command' |
| artmail | 'php artisan make:mail' |
| artseeder | 'php artisan make:seeder' |
| arttest | 'php artisan make:test' |



##  Installation  ##

- Clone this repo
- Go to '~/.oh-my-zsh/plugins' folder
- Copy artisan directory from this repo
- Paste it to plugins directory
- Go to '~/' folder
- Edit '.zshrc' file with your favourite text editor
- Find the line contains 'plugins='
- Add 'artisan' between '()' ( ex: plugins=(git artisan) )
- Save it and reload your terminal

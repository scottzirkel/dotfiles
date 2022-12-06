#!/usr/bin/env bash

# Make new dir & cd into it
function mkcd {
    if [ ! -n "$1" ]; then
        echo "Enter a directory name"
    elif [ -d $1 ]; then
        echo "\`$1' already exists"
    else
        mkdir $1 && cd $1
    fi
}

# Determine size of a file or total size of a directory
function fs {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh;
    else
        local arg=-sh;
    fi
    if [[ -n "$1" ]]; then
        du $arg -- "$1";
    else
        du $arg .[^.]* ./*;
    fi;
}

# All the dig info
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer
}

#shortcut voor zhs quick-look command
function ql() {
   quick-look "$1"
}

function weather() {
   city="$1"

   if [ -z "$city" ]; then
      city="Bandera"
   fi

   eval "curl http://wttr.in/${city}"
}

#  Commit everything
function commit() {
  commitMessage="$1"

  if [ "$commitMessage" = "" ]; then
     commitMessage="commit"
  fi

  git add .
  eval "git commit -a -m '${commitMessage}'"
}

function db {
    if [ "$1" = "refresh" ]; then
        mysql -uroot -e "drop database $2; create database $2"
    elif [ "$1" = "create" ]; then
        mysql -uroot -e "create database $2"
    elif [ "$1" = "drop" ]; then
        mysql -uroot -e "drop database $2"
    fi
}

function tinker() {
  if [ -z "$1" ]
    then
      php artisan tinker
    else
      php artisan tinker --execute="dd($1);"
  fi
}

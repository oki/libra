#!/bin/bash

DIR="vendor/plugins/oki_capistrano_tasks"
mkdir -p $DIR
if [ ! -h $DIR ]; then
    ln -s ~/rails/deployment $DIR
    cat .gitignore | grep "$DIR" || echo "$DIR" >> .gitignore 
fi

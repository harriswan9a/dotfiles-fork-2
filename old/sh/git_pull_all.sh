#!/bin/bash
############################
# Git pull all folder
############################

arr=(./*)

ROOT_DIR=`pwd`

for f in "${arr[@]}"; do
   if [ -d "$f" ]; then
        if [ -d "$f/.git" ]; then
            cd "$f"
            BRANCH=`git branch | grep "*" | cut -d' ' -f2`
            echo "$f => branch is [${BRANCH}]"
            FILE_CHANGED=`git status -s | wc -l | xargs`
            if [ "${BRANCH}" == "master" ] && [ "${FILE_CHANGED}" == "0" ]; then
                git remote update origin --prune
                echo "pulling..."
                git pull origin master
                if [ "echo $?" != "0" ]; then git remote -v; fi
            fi
            cd ${ROOT_DIR}
        fi
   fi
done

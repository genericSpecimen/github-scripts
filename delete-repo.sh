#!/bin/bash

#----------------remote repository deletion-------------------

BASE_URL='https://api.github.com/user/repos'

read -p 'Authorization token: ' AUTH_TOKEN
read -p 'Enter username: ' USERNAME
read -p 'Enter name of repo to delete: ' REPO_NAME
curl -X DELETE -H "Authorization: token $AUTH_TOKEN" https://api.github.com/repos/$USERNAME/$REPO_NAME

#------------------------------------------------------------

#----------------local repository deletion-------------------

read -p 'Enter local path where the repository is located (. for current working directory): ' LOCAL_PATH
rm -rf $LOCAL_PATH/$REPO_NAME

#------------------------------------------------------------

#!/bin/bash

#----------------remote repository deletion-------------------

BASE_URL='https://api.github.com/user/repos'

read -p 'Authorization token: ' AUTH_TOKEN
read -p 'Enter username: ' USERNAME
read -p 'Enter name of repo to delete: ' REPO_NAME
curl -X DELETE -H "Authorization: token $AUTH_TOKEN" https://api.github.com/repos/$USERNAME/$REPO_NAME

#------------------------------------------------------------

#----------------local repository deletion-------------------
read -p 'Do you want to delete the local repository as well? (y/n): ' DELETE_LOCAL
if [ "$DELETE_LOCAL" = "y" ]; then
	read -p 'Enter local path where the repository is located (. for current working directory): ' LOCAL_PATH
	bold=$(tput bold)
	normal=$(tput sgr0)
	read -p "The local repository: ${bold}"$LOCAL_PATH/$REPO_NAME"${normal} will be deleted permanently! Is this what you intend to do? (y/n): " RM_CHECK
	if [ "$RM_CHECK" = "y" ]; then
		rm -rf $LOCAL_PATH/$REPO_NAME
	else
		echo "Did not delete the local repository."
	fi
else
	exit 0
fi
#------------------------------------------------------------

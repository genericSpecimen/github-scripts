#!/bin/bash

#----------------remote repository creation-------------------

BASE_URL='https://api.github.com/user/repos'

read -p 'Authorization token: ' AUTH_TOKEN
read -p 'Enter new repo name: ' REPO_NAME
read -p 'Enter description (ENTER for empty): ' DESCRIPTION
read -p 'Do you want to make the repository private? (y/n): ' PRIVATE_flag
read -p 'Initialise with empty README? (y/n): ' README_flag

if [ "$PRIVATE_flag" = "y" ]; then
	PRIVATE=true
else
	PRIVATE=false
fi

if [ "$README_flag" = "y" ]; then
	README=true
else
	README=false
fi

NEW_REPO_SSH_URL=$(curl -i -H "Authorization: token $AUTH_TOKEN" \
	-d '{"name": "'$REPO_NAME'", "description": "'$DESCRIPTION'", "private": '$PRIVATE', "auto_init": '$README'}' $BASE_URL | grep ssh_url | cut -d '"' -f 4)
echo "Created: "$NEW_REPO_SSH_URL

#------------------------------------------------------------

#----------------local repository creation-------------------

read -p 'Enter local path where the new repository should be placed: (. for current working directory) :' LOCAL_PATH
mkdir $LOCAL_PATH/$REPO_NAME
cd $LOCAL_PATH/$REPO_NAME && git init && git remote add origin $NEW_REPO_SSH_URL

#------------------------------------------------------------

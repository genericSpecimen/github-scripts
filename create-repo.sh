#!/bin/bash

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

curl -i -H "Authorization: token $AUTH_TOKEN" \
	-d '{"name": "'$REPO_NAME'", "description": "'$DESCRIPTION'", "private": '$PRIVATE', "auto_init": '$README'}' $BASE_URL


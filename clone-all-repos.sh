#!/bin/bash

BASE_URL='https://api.github.com/user/repos'

read -p 'Authorization token: ' AUTH_TOKEN
read -p 'Enter local path where the repositories should be cloned (. for current working directory): ' LOCAL_PATH
cd $LOCAL_PATH
curl -i -H "Authorization: token $AUTH_TOKEN" $BASE_URL | grep ssh_url | cut -d '"' -f 4 | xargs -L1 git clone


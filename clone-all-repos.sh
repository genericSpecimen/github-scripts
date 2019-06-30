#!/bin/bash

BASE_URL='https://api.github.com/user/repos'

read -p 'Authorization token: ' AUTH_TOKEN

curl -i -H "Authorization: token $AUTH_TOKEN" $BASE_URL | grep ssh_url | cut -d '"' -f 4 | xargs -L1 git clone


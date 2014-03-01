#! /bin/bash

username=kunaltyagi
token=3748f5bc743f5bc80d74ccadbbadedc983faceb0
repo_name=$1

#    url=https://github.com/api/v2/yaml/repos/create #for v2
url=https://api.github.com/user/repos/
#    curl -u '$username' $url -d '{"name":"$repo_name"}'
curl -i -H 'Authorization: token $token' -d '{ "name": "$username", "auto_init": true, "private": false, "gitignore_template": "C++"}' $url

git remote add origin git@github:$username/$repo_name.git
git push origin master

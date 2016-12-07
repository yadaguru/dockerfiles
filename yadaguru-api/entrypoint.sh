#!/bin/bash

cd /opt/yadaguru-api
echo "pulling the latest updates and switching to: [$MY_BRANCH]"
git pull && git checkout $MY_BRANCH

npm update

echo "Starting Yadaguru API"
su -c 'npm start' yadaguru

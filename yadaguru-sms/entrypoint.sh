#!/bin/bash

cd /opt/yadaguru-sms
echo "pulling the latest updates and switching to: [$MY_BRANCH]"
git pull && git checkout $MY_BRANCH

npm update

echo "Running Yadaguru SMS Task"
su -c 'npm start' yadaguru

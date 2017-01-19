#!/bin/bash

cd /srv/yadaguru/yadaguru-app
echo "(yadaguru-app) pulling the latest updates and switching to: [$MY_BRANCH]"
git pull && git checkout $MY_BRANCH && npm install && bower install --force-latest --allow-root && gulp build

cd /srv/yadaguru/yadaguru-admin
echo "(yadaguru-admin) pulling the latest updates and switching to: [$MY_BRANCH]"
git pull && git checkout $MY_BRANCH && npm install --unsafe-perm

nginx
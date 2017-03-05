#!/bin/bash

cd /srv/yadaguru/yadaguru-app
git checkout -- .
echo "[yadaguru-app] pulling the latest updates and switching to: [$MY_BRANCH]"
git pull && git checkout $MY_BRANCH && npm install && bower install --force-latest --allow-root && \
echo "[yadaguru-app] for $NODE_ENV"
gulp build && gulp constants --db $NODE_ENV

cd /srv/yadaguru/yadaguru-admin
git checkout -- .
echo "[yadaguru-admin] pulling the latest updates and switching to: [$MY_BRANCH]"
git pull && git checkout $MY_BRANCH && npm install --unsafe-perm

nginx

FROM kyma/docker-nginx

COPY ./default /etc/nginx/sites-enabled

ARG NODE_VERSION=4.x
ENV MY_BRANCH=master

RUN apt-get clean && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yqq apt-transport-https \
                                                        ca-certificates \
                                                        curl \
                                                        git \
                                                        supervisor

RUN curl --fail -ssL -o /tmp/setup-nodejs https://deb.nodesource.com/setup_$NODE_VERSION && \
    bash /tmp/setup-nodejs && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq nodejs build-essential && \
    rm -rf /tmp/setup-nodejs

RUN git clone https://github.com/yadaguru/yadaguru-app.git /srv/yadaguru/yadaguru-app && \
    git clone https://github.com/yadaguru/yadaguru-admin.git /srv/yadaguru/yadaguru-admin && \
    npm install -g bower gulp-cli && \
    cd /srv/yadaguru/yadaguru-app && \
    npm install --unsafe-perm && bower install --force-latest --allow-root && gulp build && \
    cd /srv/yadaguru/yadaguru-admin && \
    npm install --unsafe-perm

COPY supervisord.conf /etc/supervisor/conf.d/
COPY entrypoint.sh /

RUN chmod a+x /entrypoint.sh

CMD ["/usr/bin/supervisord"]
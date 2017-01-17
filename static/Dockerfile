FROM kyma/docker-nginx

COPY ./default /etc/nginx/sites-enabled

RUN apt-get clean && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yqq apt-transport-https \
                                                        ca-certificates \
                                                        curl \
                                                        git \
                                                        supervisor

RUN mkdir -p /srv/yadaguru/yadaguru-app && \
    mkdir -p /srv/yadaguru/yadaguru-admin/app

COPY entrypoint.sh /

RUN chmod a+x /entrypoint.sh

CMD ["/usr/bin/supervisord"]
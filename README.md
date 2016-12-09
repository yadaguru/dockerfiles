# Yadaguru Docker Files

This repo contains Dockerfiles and docker-compose files for local and production deployments of Yadaguru.

For help on getting Yadaguru setup on your local machine, see the 
[Yadaguru Dev Environment Setup](https://github.com/yadaguru/yadaguru-app/wiki/Yadaguru-Dev-Environment-Setup).

##yadaguru/api
The container containing the NodeJS REST API. Running this container will pull down the master branch of
[yadaguru-api](https://github.com/yadaguru/yadaguru-api), install all tools and libraries needed, and start
the app using Supervisor. 

##yadaguru/postgres
A development Postgres database container. This container will provision itself with all needed tables and
data when run. *This container is intended for development environments only.*

##yadaguru/static
A static file server for serving the [yadaguru-app](https://github.com/yadaguru/yadaguru-app) and
[yadaguru-admin](https://github.com/yadaguru/yadaguru-admin) Angular apps. *This container is intended for
development environments only.*

##Compose Files
A collection of docker-compose files for quickly bringing up a whole stack. 

###yada-dev-stack
The Yada Dev Stack Pulls down `yadaguru-api`, `postgres`, and `static` from Yadaguru's 
[Docker Hub](https://hub.docker.com/u/yadaguru/) account. It exposes the following ports:

 - `3005` - yadaguru-api NodeJS app
 - `5858` - debug listener for the API
 - `3000` - yadaguru-app static files
 - `9000` - yadaguru-admin static files
 - `5432` - Postgres database

and links the following volumes:

 - `~/yadaguru/yadaguru-api` -> `yadaguru/api:/opt/yadaguru-api`
 - `~/yadaguru/yadaguru-admin/app` -> `yadaguru/static:/srv/yadaguru/yadaguru-admin/app`
 - `~/yadaguru/yadaguru-app/` -> `yadaguru/static:/srv/yadaguru/yadaguru-app` 

*NOTE the location of the host repos:* the docker-compose file assumes that all repos are located in the
user's home directory, in a folder called `yadaguru`.

The API is started with nodemon in debug mode, meaning that it will watch for changes and exposes remote
debugging on port 5858.

For step-by-step instructions on setting up yada-dev-stack, see the 
[Yadaguru Dev Environment Setup](https://github.com/yadaguru/yadaguru-app/wiki/Yadaguru-Dev-Environment-Setup).

##Contributing
To contribute to the Yadaguru docker files, please create a separate branch and open a pull request.

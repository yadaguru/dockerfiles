FROM postgres:9.4.9

ENV POSTGRES_USER=yadaguru
ENV POSTGRES_PASSWORD=yadaguru
ENV POSTGRES_DB=yadaguru

COPY yadaguru.sql /docker-entrypoint-initdb.d/

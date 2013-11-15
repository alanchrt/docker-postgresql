# DOCKER-VERSION 0.6.4

FROM ubuntu:12.04

RUN apt-get update
RUN apt-get install -y python-software-properties
RUN add-apt-repository -y ppa:pitti/postgresql
RUN apt-get update
RUN apt-get -y install postgresql-9.2 postgresql-client-9.2 postgresql-contrib-9.2

RUN service postgresql start
RUN su postgres -c 'psql -c "alter user postgres with password '"'"'docker'"'"';"'

EXPOSE 5432
CMD ["service postgresql start"]

FROM debian:latest

RUN apt-get update && apt-get install curl -y && apt-get install gpg -y && apt-get install curl ca-certificates gnupg && apt-get install vim -y

RUN curl https://www.postgresql.org/media/keys/ACCC4CF8.asc \
| gpg --dearmor \
| tee /etc/apt/trusted.gpg.d/apt.postgresql.org.gpg > /dev/null 

RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ bullseye-pgdg main" > /etc/apt/sources.list.d/postgresql.list'

ENV USER=postgres

RUN apt-get update && apt-get upgrade -y && \

apt-get install postgresql-9.6 -y && \
apt-get install python3-pip -y && \   
pip install psycopg2-binary && \
pip install patroni[etcd] && \ 
mkdir -p /data/patroni && \
chown postgres:postgres /data/patroni && \
chmod 777 /data/patroni 

COPY ./patroni.yml ./etc/patroni.yml
COPY ./patroni.service ./etc/systemd/system/patroni.service 

CMD su postgres service postgresql start

CMD patroni /etc/patroni.yml



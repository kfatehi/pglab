VERSION 0.6

build:
  FROM ubuntu:20.04
  ENV DEBIAN_FRONTEND=noninteractive
  ENV TZ=America/Los_Angeles
  RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
  RUN apt update && apt upgrade -y && apt install -y vim tmux git curl wget build-essential libreadline-dev zlib1g-dev flex bison libxml2-dev libxslt-dev libssl-dev libxml2-utils xsltproc
  COPY ./postgresql /usr/src/postgresql
  WORKDIR /postgresql-build
  RUN /usr/src/postgresql/configure CFLAGS="-DOPTIMIZER_DEBUG"
  RUN make -j$(nproc)
  RUN make install
  RUN mkdir -p /etc/postgresql/11/main
  RUN cp /usr/src/postgresql/src/backend/utils/misc/postgresql.conf.sample /etc/postgresql/11/main/postgresql.conf
  RUN cp /usr/src/postgresql/src/backend/libpq/pg_hba.conf.sample /etc/postgresql/11/main/pg_hba.conf
  RUN useradd -s /usr/bin/bash -d /var/lib/postgres -m postgres
  RUN mkdir -p /var/lib/postgres
  RUN chown postgres /var/lib/postgres
  RUN chmod 700 /var/lib/postgres
  USER postgres
  ENV PATH /usr/local/pgsql/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
  WORKDIR /var/lib/postgres
  ENV PGVERSION 11
  COPY ./entrypoint.sh /entrypoint.sh
  CMD /entrypoint.sh
  SAVE IMAGE pglab


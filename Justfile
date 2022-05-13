clone:
  git clone --branch REL_11_16 https://git.postgresql.org/git/postgresql.git

build:
  earthly +build

bash:
  docker run --rm -it pglab bash

start: build
  mkdir -p data
  docker run --rm -v $PWD/data:/var/lib/postgres -it pglab

psql:
  docker run --rm -v $PWD/data:/var/lib/postgres

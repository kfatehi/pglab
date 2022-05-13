#!/bin/bash
DATA=/var/lib/postgres

if [[ ! -f $DATA ]]; then
  mkdir -p $DATA
  initdb -D $DATA
fi
tmux new-session postgres -D $DATA

#!/bin/bash
rm /var/lib/postgres/.*
initdb -D /var/lib/postgres
postgres --config-file=/etc/postgresql/11/main/postgresql.conf -D /var/lib/postgres

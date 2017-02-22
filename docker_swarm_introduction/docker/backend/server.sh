#!/usr/bin/env sh

while true; do
    echo -e "HTTP/1.1 200 OK\n\nI am the backend server" \
    | nc -l 80;
done

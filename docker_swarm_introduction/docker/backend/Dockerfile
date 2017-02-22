FROM alpine:3.5

# Install ncat
RUN apk add --no-cache netcat-openbsd

# Copy the server-script to /opt
WORKDIR /opt
COPY ./server.sh /opt
RUN chmod +x ./server.sh

# Use ncat to run a simple webserver
EXPOSE 80
ENTRYPOINT ["./server.sh"]

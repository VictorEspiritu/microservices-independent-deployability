# Take PHP 7.1 as a base image
FROM php:7.1-cli

# Expose a running instance of PHP's built-in web server
EXPOSE 80
ENTRYPOINT ["php", "-S", "0.0.0.0:80", "-t", "web/"]

# The built-in PHP webserver only responds to SIGINT, not to SIGTERM
STOPSIGNAL SIGINT

# The code will be in /opt
RUN mkdir -p /opt
COPY ./ /opt
VOLUME /opt
WORKDIR /opt

# The server is able to serve
HEALTHCHECK --timeout=3s \
    CMD curl -f http://localhost/healthcheck || exit 1

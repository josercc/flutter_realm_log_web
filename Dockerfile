FROM caddy:latest
RUN mkdir /app/
ADD . /app/
RUN caddy start --config /app/Caddyfile

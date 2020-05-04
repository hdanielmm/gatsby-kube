FROM node
COPY . /home/gatsby-wordpress
WORKDIR /home/gatsby-wordpress
RUN ["yarn"]
RUN ["yarn", "build"]

FROM caddy/caddy:alpine
EXPOSE 80
COPY --from=0 /home/gatsby-wordpress/public /var/www/html
COPY --from=0 /home/gatsby-wordpress/Caddyfile /etc/caddy/Caddyfile

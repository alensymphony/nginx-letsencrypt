FROM nginx:1.19-alpine
COPY index.html /usr/share/nginx/html
RUN apk add inotify-tools certbot openssl ca-certificates
WORKDIR /opt
COPY entrypoint.sh nginx-letsencrypt
COPY certbot.sh certbot.sh
COPY default.conf /etc/nginx/conf.d/default.conf
COPY ssl-options/ /etc/ssl-options
RUN chmod +x nginx-letsencrypt && \
    chmod +x certbot.sh 
ENTRYPOINT ["./nginx-letsencrypt"]
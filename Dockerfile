FROM nginx:1.19-alpine
RUN apk add inotify-tools certbot openssl ca-certificates
WORKDIR /opt
COPY entrypoint.sh nginx-letsencrypt
COPY certbot.sh certbot.sh
COPY ./config/ /etc/nginx/
COPY ssl-options/ /etc/ssl-options
RUN chmod +x nginx-letsencrypt && \
    chmod +x certbot.sh 
ENTRYPOINT ["./nginx-letsencrypt"]

# Nginx-Letsencrypt Docker

A single container to allow an nginx container to be up and running with an ACME certificate with a single command.

This is a companion repository to the post where its usage is explained @ https://ilhicas.com/2019/03/02/Nginx-Letsencrypt-Docker.html

# Usage

In default.conf change server_name to your domain. Copy your site to /etc/nginx/html/

Uncommend this line in certbot.sh to use staging LetsEncrypt environment and to avoid limits (10 per day, 50 per week)
		#--test-cert \

# Building
docker build -t nginx-letsencrypt .

# Running
docker run -v /root/nginx-letsencrypt/certs:/etc/letsencrypt -e CN=testing.zigguratintl.com -e SAN=testing.zigguratintl.com -p 80:80 -p 443:443 -d nginx-letsencrypt

Or add ENV variables to Dockerfile

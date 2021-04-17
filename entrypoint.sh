if [[ ! -f /var/www/_letsencrypt ]]; then
    mkdir -p /var/www/_letsencrypt
fi
certbot certonly \
                --config-dir "${LETSENCRYPT_DIR:-/etc/letsencrypt}" \
                --agree-tos \
                --domains "$SAN" \
                --email "contact@zigguratintl.com" \
                --expand \
                --noninteractive \
                --webroot \
                --webroot-path /var/www/_letsencrypt \
                --test-cert \
                $OPTIONS || true

if [[ -f "${LETSENCRYPT_DIR:-/etc/letsencrypt}/live/$CN/privkey.pem" ]]; then
    cp "${LETSENCRYPT_DIR:-/etc/letsencrypt}/live/$CN/privkey.pem" /usr/share/nginx/certificates/privkey.pem
    cp "${LETSENCRYPT_DIR:-/etc/letsencrypt}/live/$CN/fullchain.pem" /usr/share/nginx/certificates/fullchain.pem
fi

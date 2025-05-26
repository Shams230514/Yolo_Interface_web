# Image de base Nginx
FROM nginx:alpine

# Copier l'interface web
COPY index.html /usr/share/nginx/html/

# Exposer le port 8080 (requis par OpenShift)
EXPOSE 8080

# Configuration pour OpenShift (permissions non-root)
RUN chmod -R 777 /var/cache/nginx /var/run /var/log/nginx /usr/share/nginx/html && \
    sed -i 's/listen       80;/listen       8080;/' /etc/nginx/conf.d/default.conf

# Démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]

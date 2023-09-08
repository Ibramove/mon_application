# Utilisez l'image Ubuntu 20.04 comme base
FROM ubuntu:20.04

# Mettez à jour les paquets disponibles et installez Nginx et Git
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Supprimez le contenu existant du répertoire HTML de Nginx
RUN rm -rf /var/www/html/*

# Clonez le dépôt Git dans le répertoire HTML
RUN git clone https://github.com/diranetafen/static-website-example.git /var/www/html/


# Exposez le port 80 pour le serveur web Nginx
EXPOSE 80

# CMD démarre Nginx en mode daemon
CMD ["nginx", "-g", "daemon off;"]



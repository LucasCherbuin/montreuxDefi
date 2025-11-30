FROM php:8.2-apache

# Activer mod_rewrite
RUN a2enmod rewrite

# Installer dépendances système et PHP
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpq-dev \
    curl \
    gnupg \
    dos2unix \
    default-jre \
    && docker-php-ext-install pdo pdo_pgsql \
    && rm -rf /var/lib/apt/lists/*

# Installer Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Installer Symfony CLI
COPY --from=ghcr.io/symfony-cli/symfony-cli:latest /usr/local/bin/symfony /usr/local/bin/symfony

# Installer OpenAPI Generator
RUN curl -L https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/7.5.0/openapi-generator-cli-7.5.0.jar \
    -o /usr/local/bin/openapi-generator.jar

# Installer Node.js et npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && node -v \
    && npm -v

# Définir le répertoire de travail
WORKDIR /var/www/html

# Désactiver le blocage de paquets vulnérables
RUN composer config --global audit.block-insecure false


# Déplacer les fichiers Symfony vers la racine
RUN mv app/* app/.* . 2>/dev/null || true && rm -rf app

# Copier le code local si nécessaire
COPY . .

# Convertir les fichiers PHP en format Unix
RUN find . -name "*.php" -exec dos2unix {} \;


# Créer l'app Vue via Vite
RUN npm create vite@latest my-vue-app -- --template vue \
    && cd my-vue-app \
    && npm install \
    && npm install marked --save \
    && cd ..

# Nettoyer le cache Symfony
RUN rm -rf var/cache/*

# Modifier le DocumentRoot d'Apache
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

# Permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Exposer le port
EXPOSE 80

# Commande de démarrage
CMD ["apache2-foreground"]

# COMMANDES UTILES :
# docker build -t montreuxdefi .
# docker run -dit --name montreuxDefi -p 8000:80 montreuxdefi
# docker exec -it montreuxDefi bash

#!/bin/bash
set -e

# Ensure permissions
chown -R www-data:www-data /var/www/html/cache
chown -R www-data:www-data /var/www/html/public
chown -R www-data:www-data /var/www/files

# Make the persistent files directory if it doesn't exist
mkdir -p /var/www/files
chmod -R 777 /var/www/files

# Start Apache
apache2-foreground

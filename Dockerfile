FROM pkpofficial/ojs:stable-3_4_0

USER root

# Fayllar papkasini yaratish va ruxsat berish
RUN mkdir -p /var/www/files && chmod -R 777 /var/www/files

# Jildlarga ruxsat (faqat keraklilariga)
RUN chmod -R 777 /var/www/html/public /var/www/html/cache

# Maxsus Config shablonini nusxalash
COPY config.TEMPLATE.inc.php /var/www/html/config.TEMPLATE.inc.php

# PHP konfiguratsiyasi (SSL uchun)
RUN echo "variables_order = \"EGPCS\"" > /usr/local/etc/php/conf.d/render.ini

EXPOSE 80

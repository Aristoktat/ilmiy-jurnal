FROM pkpofficial/ojs:stable-3_4_0

USER root

# Fayllar papkasini yaratish (chmod 777 yetarli)
RUN mkdir -p /var/www/files && chmod -R 777 /var/www/files

# Jildlarga ruxsat (faqat keraklilariga)
RUN chmod -R 777 /var/www/html/public /var/www/html/cache

EXPOSE 80

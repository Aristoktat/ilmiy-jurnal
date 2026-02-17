FROM pkpofficial/ojs:stable-3_4_0

# Render uchun kerakli papkalarni ochish va huquqlarni to'g'irlash
USER root

# Fayllar papkasini yaratish (Disk ulanadigan joy)
RUN mkdir -p /var/www/files && chown -R www-data:www-data /var/www/files && chmod -R 777 /var/www/files

# Public va Cache papkalarga ruxsat berish
RUN chown -R www-data:www-data /var/www/html/public /var/www/html/cache

# Apache konfiguratsiyasi (agar kerak bo'lsa, lekin rasmiysi o'zi yetarli bo'ladi)
# Biz faqat portni ochamiz
EXPOSE 80

# Asl entrypointni ishga tushirish
USER www-data

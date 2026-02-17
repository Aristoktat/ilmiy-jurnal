<h1>Open Journal Systems (OJS) on Render.com</h1>

Bu loyiha **OJS 3.4** versiyasini Docker yordamida **Render.com** serveriga o'rnatish uchun tayyorlandi.

## 🚀 O'rnatish bo'yicha qo'llanma

### 1. GitHubga yuklash
Ushbu papkani (`ojs-render`) GitHub repozitoriyingizga yuklang.

### 2. Render.com da sozlash
1.  **New +** -> **Web Service** ni tanlang.
2.  GitHub repozitoriyni ulang.
3.  **Runtime:** `Docker` deb tanlang (Bu juda muhim!).
4.  **Region:** Frankfurt (yoki o'zingizga yaqin).
5.  **Instance Type:** Free (bepul).

### 3. Environment Variables (Muhim o'zgaruvchilar)
Quyidagi o'zgaruvchilarni "Environment" bo'limiga qo'shing:

- `OJS_DB_HOST`: (Sizning PostgreSQL yoki MySQL host manzilingiz)
- `OJS_DB_USER`: (Baza foydalanuvchisi)
- `OJS_DB_PASSWORD`: (Baza paroli)
- `OJS_DB_NAME`: (Baza nomi, masalan `ojs`)
- `OJS_BASE_URL`: `https://sizning-saytingiz.onrender.com`

> **Eslatma:** OJS barqaror ishlashi uchun **MySQL** tavsiya qilinadi, lekin PostgreSQL ham ishlaydi.

### 4. Doimiy Xotira (Persistent Disk) - MUHIM! ⚠️
OJS yuklangan maqolalar (PDF) va rasmlarni saqlash uchun **Disk** kerak.
Renderda **Disks** bo'limidan yangi disk qo'shing:

- **Name:** `ojs-files`
- **Mount Path:** `/var/www/files`
- **Size:** 1 GB (yoki ko'proq)

### 5. Ishga tushirish
Deploy tugmasini bosing. O'rnatish 5-10 daqiqa vaqt olishi mumkin.
Sayt ochilganda **OJS Installation** sahifasi chiqadi.

U yerda:
- **Directory for uploads:** `/var/www/files` deb yozing.
- **Database Driver:** PostgreSQL yoki MySQL (serveringizga qarab).
- **Database Host, User, Password:** Environment variable'da yozganlaringizni kiriting.
- **Uncheck:** "Create new database" (chunki Render bazani o'zi yaratib bergan bo'ladi).

Olg'a! 🎓

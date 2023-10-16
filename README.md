# Template Proyek Flutter BLOC

## Cara Penggunaan
### Clone Repository
Dengan menggunakan metode clone, maka kamu akan mengambil data mentah dari branch `master` pada repository. Hal ini berarti kamu perlu mengubah beberapa settingan nama proyek pada beberapa file yang terdapat di dalam template proyek Flutter BLOC. Berikut adalah langkah-langkahnya.
1. Buka Git Bash
2. Lalu masukkan perintah `git clone https://github.com/hidayatullah191001/flutter-bloc-architecture.git`
3. Tunggu hingga selesai
4. Ubah nama folder sesuai dengan nama projek kamu
5. Ubah nama projek lama di pubspec, AndroidManifest dengan nama projek baru kamu
6. Jalankan `flutter pub get`
7. Selesai

### Bash
Dengan menggunakan script bash, kamu hanya menjalankan program shell dan proyek akan langsung tercloning sekaligus merubah nama projek lama sesuai dengan inputan projek baru yang ingin kamu buat. Berikut adalah langkah-langkahnya. 
1. Buka Notepad
2. Pastekan kode bash berikut (Script tidak boleh diubah)
```
#!/bin/bash
GITHUB_USERNAME="hidayatullah191001"
REPO_NAME="flutter-bloc-architecture"
BRANCH="master"

echo "Template Proyek Flutter BLOC Architecture"
echo "Created By : Hidayatullah"
echo "Github : https://github.com/hidayatullah191001"
echo ""

read -p "Masukkan nama proyek baru: " NEW_PROJECT_NAME
GITHUB_REPO_URL="https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
git clone --single-branch --branch $BRANCH $GITHUB_REPO_URL $NEW_PROJECT_NAME
cd $NEW_PROJECT_NAME
find . -type f -exec sed -i "s/safesavings/$NEW_PROJECT_NAME/g" {} \;
flutter create .

echo "Proyek Flutter dari template telah berhasil dibuat dengan nama: $NEW_PROJECT_NAME" 
```

3. Save pada folder projek flutter anda dengan nama `nama_file.sh`
4. Buka Git Bash pada folder penyimpanan kode diatas
5. Jalankan perintah `chmod +x nama_file.sh`
6. Lalu jalankan file `nama_file.sh` atau dengan mengetikkan `./nama_file.sh` di git bash
7. Masukkan nama projek anda, lalu enter dan tunggu hingga proses selesai
8. Proyek berhasil dibuat

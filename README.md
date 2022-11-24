# Tugas 8: Flutter Form

## Nama         : Nadhif Rahman Alfan

## NPM          : 2106751783

**1. Jelaskan perbedaan `Navigator.push` dan `Navigator.pushReplacement`.**

`Navigator.push` akan mengarahkan aplikasi ke layar yang diinginkan dengan menambahkan rute ke stack. Sedangkan `Navigator.pushReplacement` akan melakukan hal yang sama, namun akan menggantikan route yang berada di bagian atas stack.

**2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.**

- `Form()`, digunakan untuk membuat wadah untuk bidang formulir.
- `TextFormField()`, digunakan untuk membuat bidang formulir yang berisi bidang teks.
- `DropdownButtonFormField()`, digunakan untuk membuat form field berupa tombol dropdown.
- `ShowDatePicker()`, digunakan untuk menampilkan dialog pemilih tanggal material.
- `ListView()`, digunakan untuk membuat widget array linier yang dapat digulir.
- `Drawer()`, digunakan untuk membuat sidebar.

**3. Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).**

- `onPressed`, event untuk setelah peng-klik-an tombol selesai
- `onSaved`, event untuk setelah user menyimpan
- `onChanged`, event untuk ketika perubahan terjadi
- `onTap`, event untuk sesaat setelah user meng-klik tombol

**4. Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.**

Navigator atau navigasi pada aplikasi Flutter dibuat dalam struktur stack, dimana layar yang berada di bagian atas stack menjadi layar saat ini. metode `push` akan menambahkan layar baru ke bagian atas tumpukan membuat aplikasi flutter menavigasi ke layar baru, sedangkan metode `pop` akan menghapus layar dari bagian atas tumpukan membuat aplikasi flutter menavigasi kembali ke layar sebelumnya.

**5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.**

Pertama-tama saya membuat widget Drawer pada file terpisah. Hal tersebut dilakukan untuk menyediakan navigasi aplikasi Flutter. Setelah itu, saya membuat tampilan tambah budget. Pada layar tersebut, saya membuat form untuk menambahkan budget dan saya juga menambahkan elemen date pada form untuk bonus. Kemudian, untuk menyimpan yang dimasukkan dari form budget dan membuatnya dapat diakses di layar mana pun, saya membuat status menggunakan Provider. Sehingga setiap kali data diinput oleh pengguna, keadaan lokal akan diperbarui dan setiap kali pengguna menyimpan data, data akan disimpan ke global sate. Terakhir, saya membuat tampilan data budget. Tampilan ini berisi daftar data budget yang diambil dari data yang disimpan dalam global state.

# Tugas 7: Elemen Dasar Flutter

## Nama         : Nadhif Rahman Alfan

## NPM          : 2106751783

1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

Stateless widget adalah widget yang memiliki state atau kondisi yang bersifat statis dengan kata lain tidak dapat berubah-ubah kondisinya. Sementara itu stateful widget adalah widget yang memiliki state atau kondisi yang bersifat non-statis dengan kata lain dapat berubah-ubah kondisinya. Perbedaannya terdapat pada proses pembentukannya. Pada stateless, setelah widget dikonstruksi atau construct oleh suatu constructor, widget akan langsung dibentuk atau build oleh program. Sementara pada stateful, setelah widget dikonstruksi oleh suatu constructor, widget perlu diproses pada internal state terlebih dahulu untuk menentukan keadaan widget apakah terdapat penambahan atau perubahan data.

2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
  - Scafold : Berfungsi untuk canvas utama atau tampilan app
  - AppBar : Berfungsi untuk membuat appbar yang berisi judul pada app
  - Text : Berfungsi untuk menulis sebuah tulisan
  - Center : Berfungsi untuk membuat widget dengan layout center
  - Padding : Berfungsi untuk membuat widget dengan padding sesuai yang diinginkan
  - Column : Berfungsi untuk membuat widget dengan memposisikan widget-widget secara vertikal
  - Row : Berfungsi untuk membuat widget dengan memposisikan widget-widget secara horizontal
  - Container : Berfungsi untuk menaruh widget dengan padding dan painting tertentu
  - FloatingActionButton : Berfungsi untuk membuat widget tombol
  - Icon : Berfungsi untuk membuat widget dengan icon

3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

setState berfungsi sebagai merubah/menambahkan state pada suatu object ataupun data dan meneruskannya menuju internal state. Sehingga ketika internal state menerima sinyal perubahan state, program akan secara otomatis membentuk ulang atau rebuild widget yang berhubungan dengan object ataupun data tersebut. Variabel yang dapat terdampak yakni variabel-variabel yang digunakan dalam widget stateful. Sehingga ketika setState dipanggil, variable-variable pada widget stateful yang digunakan dalam setState akan terpengaruh dan otomatis akan melakukan rebuild ulang pada widget. Contoh variabel pada program saya yakni variabel counter yang dimana digunakan dalam widget text untuk menampilkan tulisan namun variabel tersebut juga terdapat pada setState sehingga widget akan direbuild ketika setState dipanggil.

4. Jelaskan perbedaan antara const dengan final

Const dan final merupakan keyword yang berfungsi untuk membuat variable menjadi bersifat immutable. Perbedaannya terdapat pada waktu inisiasinya dimana const sudah harus diketahui nilai atau data pada variabel saat waktu kompilasi sementara final tidak mengharuskan nilai atau data variabel diketahui pada saat kompilasi.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

Pertama-tama saya membuat project app bernama counter_7 dengan command `flutter create counter_7`. Setelah itu saya memodifikasi `main.dart` pada folder `lib` untuk merubah tampilan. Hal pertama yang saya modifikasi yakni membuat sebuah fungsi decrementCounter untuk merubah state (setState) variabel counter untuk di decrement. Berikutnya saya membuat function checkCounter untuk mengecek apakah counter berangka ganjil ataupun genap. Function tersebut nantinya akan mengembalikan sesuai dengan nilainya, apabila nilai counter merupakan ganjil maka function akan mengembalikan text berupa `GANJIL` sementara apabila nilai counter merupakan genap makan function akan mengembalikan text berupa `GENAP`. Setelah itu, saya menembahkan widget pada children Column berupa FloatingActionButton untuk menampilkan tombol decrement counter. Button tersebut ditambahkan event handler berupa function decrementCounter dan ditambahkan icon berupa Icons.remove. Saya juga menambahkan padding pada function tersebut agar posisi button decrement dan increment sejajar. Saya juga menambahkan allignment agar kedua button terdapat pada kiri dan kanan layar.

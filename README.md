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

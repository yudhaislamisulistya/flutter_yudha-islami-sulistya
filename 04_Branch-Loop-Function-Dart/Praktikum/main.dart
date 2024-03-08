// void main() {
//   // if (1 != 1 || 2 == 2) {
//   //   print("ini benar");
//   // }

//   // var age = 18;
//   // if (age <= 19) {
//   //   // 22 <= 19 -> false
//   //   // 18 <= 19 -> true
//   //   print("anda masih remaja");
//   // } else {
//   //   print("anda bukan remaja");
//   // }

//   // var nilai = "D";

//   // switch (nilai) {
//   //   case 'A':
//   //     print("Sangat Baik");
//   //     break;
//   //   case 'B':
//   //     print("Baik");
//   //     break;
//   //   case 'C':
//   //     print("Cukup Baik");
//   //     break;
//   //   default:
//   //     print("Nilai Tidak Valid");
//   // }

//   // for (int i = 0; i < 10; i++) {
//   //   print(i);
//   // }

//   // 1. Inisial Sebuah Variable
//   // 2. Cek apakah i < 10 (0 < 10) -> true -> false -> keluar dari for/perulangan
//   // 3. print(i) atau tampilkan 0
//   // 4. Cek apakah i < 10 (1 < 10) -> true -> false -> keluar dari for/perulangan
//   // 5. print(i) atau tampilkan 1
//   // ...
//   // 6. Cek apakah i < 10 (9 < 10) -> true -> false -> keluar dari for/perulangan
//   // 7. print(i) atau tampilkan 9
//   // 8. Cek apakah i < 10 (10 < 10) -> false -> keluar dari for/perulangan

//   // List<String> buah = ["apel", "mangga", "pisang", "jeruk"];
//   // // buah.length -> 4

//   // // for (int i = 0; i < buah.length; i++) {
//   // //   print(buah[i]);
//   // // }

//   // for (String b in buah) {
//   //   print(b);
//   // }

//   // Map<String, int> ageMap = {
//   //   "Joko": 99,
//   //   "Prab": 88,
//   //   "Gib": 77,
//   // };

//   // for (var data in ageMap.entries) {
//   //   print('Nama ${data.key} : ${data.value} Tahun');
//   // }

//   // List<int> numbers = [for (int i = 1; i <= 5; i++) i * i + 2];
//   // print(numbers[0]);

//   for (var i = 0; true; i++) {
//     if (i == 10) {
//       break;
//     }

//     print(i);
//   }

//   for (var i = 0; i < 10; i++) {
//     if (i == 5 || i == 8) {
//       continue;
//     }

//     print(i);
//   }
// }

// // Fungsi dengan Tipe data dan Fungsi dengan Nilai Hampa Void

// void

bool isLoading = false;

void main() {
  // hello("Flutter");
  // print(jumlah(10.4, 20));
  // 10 dan 20 itu adalah Argumen a dan Argumen b

  try {
    var result = 100 ~/ 2;
    print(result);
  } catch (e) {
    print("Errornya Adalah: $e");
  } finally {
    print("Bagian ini selesai");
  }
}

void hello(String classRoom) {
  print("Selamat Datang di Kelas $classRoom");
}

double jumlah(double a, int b) {
  // int a itu paramater 1 dan int b itu paramater 2
  return a + b;
}

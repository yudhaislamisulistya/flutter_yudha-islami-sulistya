void main() {
  // Python
  // name = "Alterra Academy"
  // PHP
  // $name = 12;
  // Javascript
  // const name;
  // String name = 12;

  // int a = 2000;
  // print(a);
  // print("Selamat datang di Bahasa Pemrograman Dart!"); // baris ini bertujuan untuk menampilkan data
  // print("Nama Saya: Joko Andreas");
  // print(24);
  // print(true);

  // tipe_data nama_variabel; -> null safety
  // tipe data nama_variabel = value; -> non-nullable safety

  // var usia; // Deklarasi variabel

  // usia = 33;

  // print(usia);

  // int usia = 33; // Inisialisasi Variabel
  // print(usia);
  // final phi = 3.14;
  // print(phi);

  // int age = 33;
  // double weight = 70.5;
  // bool isMarried = true;
  // String name = "Joko Andreas";

  // print(age);
  // print(weight);
  // print(isMarried);
  // print(name);

  // Operator
  // int a = 10;
  // int b = 20;
  // int c = a + b; // operand: a dan b, operator: +
  // print(c);
  // print(1 + 2);
  // print(1 / 2);
  // print(1 - 2);
  // print(1 * 2);

  // int age = 10; // = merupakan operator assigment

  // print("1" != 10);
  // print(1 == 2 && 1 == 2);
  // print(true == true && 1 == 1);
  int? nullableInt = null;
  String? nullableString;
  print(nullableInt);
  print(nullableString);

  print(nullableInt ?? 0); // coalescing operator (??)
  print(nullableString ?? "Hello Alterra"); // coalescing operator (??)
  print(nullableInt == "1" ? 0 : 1); // ternery

  int nonNullableInt = nullableInt ?? 0;
  String nonNullableString = nullableString ?? "Hello Alterra Academy";

  print(nonNullableInt);
  print(nonNullableString);

  // String? name; // => null
  // print(name!.toUpperCase()); // null => ???

  print("==============");
  print(hello(true) == null);
}

String? hello(bool isNull) {
  return isNull ? "Hai Alta" : null;
}

// Fungsi ini bertujuan untuk menjumlahkan dua bilangan
int add(int a, int b) {
  /*
  a: int yang bertujuan sebagai blalala
  b: int yang bertujuan sebagai blalala
  a akan di jumlahkan dengan b
  */
  return a + b;
}

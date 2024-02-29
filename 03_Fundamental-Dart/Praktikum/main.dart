// void main() {
//   // Python
//   // name = "Alterra Academy"
//   // PHP
//   // $name = 12;
//   // Javascript
//   // const name;
//   // String name = 12;

//   // int a = 2000;
//   // print(a);
//   // print("Selamat datang di Bahasa Pemrograman Dart!"); // baris ini bertujuan untuk menampilkan data
//   // print("Nama Saya: Joko Andreas");
//   // print(24);
//   // print(true);

//   // tipe_data nama_variabel; -> null safety
//   // tipe data nama_variabel = value; -> non-nullable safety

//   // var usia; // Deklarasi variabel

//   // usia = 33;

//   // print(usia);

//   // int usia = 33; // Inisialisasi Variabel
//   // print(usia);
//   // final phi = 3.14;
//   // print(phi);

//   // int age = 33;
//   // double weight = 70.5;
//   // bool isMarried = true;
//   // String name = "Joko Andreas";

//   // print(age);
//   // print(weight);
//   // print(isMarried);
//   // print(name);

//   // Operator
//   // int a = 10;
//   // int b = 20;
//   // int c = a + b; // operand: a dan b, operator: +
//   // print(c);
//   // print(1 + 2);
//   // print(1 / 2);
//   // print(1 - 2);
//   // print(1 * 2);

//   // int age = 10; // = merupakan operator assigment

//   // print("1" != 10);
//   // print(1 == 2 && 1 == 2);
//   // print(true == true && 1 == 1);
//   int? nullableInt = null;
//   String? nullableString;
//   print(nullableInt);
//   print(nullableString);

//   print(nullableInt ?? 0); // coalescing operator (??)
//   print(nullableString ?? "Hello Alterra"); // coalescing operator (??)
//   print(nullableInt == "1" ? 0 : 1); // ternery

//   int nonNullableInt = nullableInt ?? 0;
//   String nonNullableString = nullableString ?? "Hello Alterra Academy";

//   print(nonNullableInt);
//   print(nonNullableString);

//   // String? name; // => null
//   // print(name!.toUpperCase()); // null => ???

//   print("==============");
//   print(hello(true) == null);

// }

// String? hello(bool isNull) {
//   return isNull ? "Hai Alta" : null;
// }

// // Fungsi ini bertujuan untuk menjumlahkan dua bilangan
// int add(int a, int b) {
//   /*
//   a: int yang bertujuan sebagai blalala
//   b: int yang bertujuan sebagai blalala
//   a akan di jumlahkan dengan b
//   */
//   return a + b;
// }

// late List getUsers;
// late List getProducts;
// late List getMembers;
// late int temperature;

// void main() {
//   print("Suhu saat ini adalah:  $temperature");
// }

// void fetchTemperature() {
//   temperature = 30;
// }

void main() {
  List<dynamic> nullableList = ["Joko", 23, 50.5, true];
  var list = [
    1,
    2,
    3,
    [3, null, 5],
    6,
    null,
    8
  ];
  print(list);
  print(nullableList);

  // Map
  Map<String?, int?> nullableMap = {
    'age': 29, // age itu sebagai key dan 29 sebagai value
    'score': null, // score itu sebagai key dan 100 sebagai value
    null: 100,
  };

  print(nullableMap);

  Map<dynamic, dynamic> biodata = {
    'name': "Suryadi",
    'age': 23,
    'weight': 70,
    'isMarried': false,
    1001: 9,
  };

  print(biodata);

  // data biodata: (name, age, weight, isMarried)

  // const maxScore = 100;
  // final response = api.getUsers();
  // response = "hello";
  // maxScore = 50;

  var data = "Keyboard";
  print(data.runtimeType);
  // var -> deklarasi atau inisialisasi
  var name; // -> Deklarasi
  var age = 20; // -> Inisialisasi
  dynamic weight; // Deklarasi
  dynamic isMarried; // Inisialisasi
  dynamic data2 = "Mouse";
  print(data2.runtimeType);

  var numbers = [1, 2, 4.5, 4, 5];
}

dynamic add(int a, int b) {
  return a + b;
}

// // class Animal {
// //   int? mata;
// //   int? kaki;

// //   Animal({required this.mata, this.kaki});

// //   // Konstruktor dengan proses didalamnya
// //   // Animal() {
// //   //   mata = 2;
// //   //   kaki = 4;
// //   //   print("Ini merupakan method yang di jalankan pertama kali");
// //   //   print("mata di set menjadi $mata dan kaki di set menjadi $kaki");
// //   // }
// // }

// // void main() {
// //   Animal cat = Animal(mata: 2);
// // }

// class Animal {
//   int? eye = 0;
//   int? foot = 0;
// }

// class Goat extends Animal {
//   Goat() {
//     eye = 2;
//     foot = 10;
//   }
// }

// void main() {
//   Animal a = Animal();
//   print(a.eye);
//   print(a.foot);
//   Goat g = Goat();
//   print(g.eye);
//   print(g.foot);
// }

// abstract class Animal {
//   int? eye = 0;
//   int? foot = 0;
//   void reproduction() {}
//   void breathe() {}
//   void fly() {}
//   void run() {}
//   void dead() {}
// }

// class Goat extends Animal {
//   @override
//   void breathe() {
//     print("Bernapas dengan paru-paru");
//   }
// }

// void main() {
//   Goat g = Goat();
//   g.reproduction();
//   g.breathe();
// }

// class Reward<T> {
//   dynamic content;
//   Reward(T i) {
//     content = i;
//   }

//   T say(T i) {
//     return i;
//   }
// }

// void main() {
//   Reward r1 = Reward<String>('Selamat Datang');
//   print(r1.content);

//   Reward r2 = Reward<int>(10);
//   print(r2.content);

//   // Menampung List?
//   Reward r3 = Reward<List<String>>(["Joko", "Raka", "Janggar"]);
//   print(r3.content[2]);

//   // Berikan Argument/Nilai ke Method say()
//   print(r3.say(["Hai", "Halo", "Konichiwa"]));

//   Reward r4 = Reward<bool>(true);
//   print(r4.content);
//   print(r4.say(false));
// }

// class Profil<T> {
//   dynamic users;

//   void setUser(T data) {
//     users = data;
//   }

//   T getUsers() {
//     return users;
//   }
// }

// void main() {
//   Profil p = Profil<Map<String, dynamic>>();
//   Map<String, dynamic> userData = {
//     'name': 'Baco',
//     'age': 23,
//   };

//   p.setUser(userData);
//   print(p.getUsers()['age']);
//   print(userData.runtimeType);
//   // p.users = {
//   //   'name': 'Baco',
//   //   'age': 23,
//   // };

//   // Map<String, dynamic> dataUser = p.getUsers(p.users);
//   // print(dataUser);

//   // {
//   //   'name': 'Baco',
//   //   'age': 23,
//   // }
//   // {'name': 'Baco','age': 23} -> yang tampil di console
// }

// class ClassRoom {
//   int publicVariable = 0;
//   int _privateVariable = 0;
// }

// void main() {
//   ClassRoom c = ClassRoom();
//   print(c.publicVariable);
//   print(c._privateVariable);
// }

// class Bank {
//   double _amount = 0.0;
//   double get amount => _amount;
//   set amount(double newAmount) {
//     if (newAmount >= 0) {
//       _amount = newAmount;
//     } else {
//       print("Saldo baru anda tidak boleh dibawah atau 0");
//     }
//   }
// }

// void main() {
//   Bank person1 = Bank();
//   person1.amount = -1000;
//   print(person1.amount);
// }

// mixin Addition {
//   void fly() {
//     print("hewan ini kemungkinan terbang");
//   }

//   void run() {
//     print("hewan ini kemungkinan berlari");
//   }
// }

// mixin AdditionFlyAnimal {
//   int wing = 2;
// }

// class Animal with Addition, AdditionFlyAnimal {
//   int eye = 0;
//   int foot = 0;

//   void reproduction() {
//     print("belum diketahui");
//   }
// }

// void main() {
//   Animal a = Animal();
//   print(a.eye);
//   print(a.foot);
//   a.reproduction();
//   a.fly();
//   a.run();
// }

// import 'mixin/users/add_mixin.dart';
// import 'mixin/users/update_mixin.dart';
// import 'mixin/users/delete_mixin.dart';
// import 'mixin/users/get_mixin.dart';

// class ControllerUser with AddFunctionUser, GetFunctionUser, UpdateFunctionUser, DeleteFunctionUser {
//   void initUsers() {}
// }

// void main() {
//   ControllerUser user = ControllerUser();
//   user.getUserByID();
// }

// enum Gender { man, woman }

// void main() {
//   var gender = Gender.man;
//   for (var data in Gender.values) {
//     print(data);
//   }

//   switch (gender) {
//     case Gender.man:
//       print("Anda adalah laki-laki");
//       break;
//     case Gender.woman:
//       print("Anda adalah perempuan");
//       break;
//     default:
//       print("Anda tidak memiliki gender");
//   }
// }

import 'dart:async';

enum Indicator { isLoading, isError, isPending, isDone }

void main() {}

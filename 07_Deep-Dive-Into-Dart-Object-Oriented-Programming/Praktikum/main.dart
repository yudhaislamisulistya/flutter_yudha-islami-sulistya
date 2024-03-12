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

abstract class Animal {
  int? eye = 0;
  int? foot = 0;
  void reproduction() {}
  void breathe() {}
  void fly() {}
  void run() {}
  void dead() {}
}

class Goat extends Animal {
  @override
  void breathe() {
    print("Bernapas dengan paru-paru");
  }
}

void main() {
  Goat g = Goat();
  g.reproduction();
  g.breathe();
}

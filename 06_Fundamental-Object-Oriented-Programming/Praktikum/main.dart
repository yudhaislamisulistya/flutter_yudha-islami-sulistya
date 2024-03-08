class Hewan {
  // Properti -> Ciri Khas dari Objek
  int mata = 0;
  int kaki = 0;
  // Method -> Kemampuan atau sifat dari Objek
  String bersuara() {
    return "meong";
  }
}

void main() {
  Hewan hewan1 = Hewan();
  // Hewan 1 merupakan kucing
  hewan1.kaki = 4;
  hewan1.mata = 2;
  print("Kucing Memiliki ${hewan1.kaki} Kaki dan Memiliki ${hewan1.mata} mata, kemudian bersuara ${hewan1.bersuara()}");
  Hewan hewan2 = Hewan();
  Hewan hewan3 = Hewan();
}

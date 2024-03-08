void main() {
  List<int> scores = [];
  scores.add(10);
  scores.add(20);
  scores.add(30);
  scores.add(40);
  scores.add(50);
  print(scores);

  // Single Object
  Map<String, dynamic> student = {
    'name': "Andi Baco",
    'age': 23,
  };

  // Array of Object
  Map<String, dynamic> students = {
    'data': [
      {
        'name': 'Andi Baco',
        'age': 23,
      }, // Index ke 0
      {
        'name': 'Jumawan',
        'age': 23,
      }, // Index ke 1
      {
        'name': 'Lestari',
        'age': 23,
      }, // Index ke 2
    ]
  };

  print(student);
  print(students);
  print(students['data'][1]['name']);

  // Set
  // Tuple
  // Dictionory = Map
  // Iterable

  // List -> []
  // Set -> {}
  // Tuple -> ()

  Set<String> animals = {"chicken", "dog", "mouse", "chicken", "chicken"};
  print(animals);

  var address = ("Godean", 12, "Yogyakarta");
  print(address);

  // Table Transaksi
  // ID, Penjual, Pembeli, Produk, Harga
  // 1, Agus, Baco, Sampo, 2000
  // 2, Agus, Lestari, Sabun Mandi, 3000
  // 3, Joko, Baco, Sampo, 2000
  // 4, Raka, Baco, Sampo, 2000
  // 5, Wowo, Baco, Sampo, 2000

  Set<String> product = {"Sampo", "Sabun Mandi", "Sampo", "Sampo", "Sampo"};
}

class BookModel {
  final int id;
  final String title;
  final String author;
  final String publishedYear;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.publishedYear,
  });

  // function fromJson
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      publishedYear: json['published_year'],
    );
  }

  // function toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'publishedYear': publishedYear,
    };
  }
}

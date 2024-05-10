// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_storage_api/models/book_model.dart';
import 'package:flutter_storage_api/services/book_service.dart';

class BookController extends ChangeNotifier {
  final BookService _bookService = BookService();
  List<dynamic>? _books;
  bool _isLoaded = false;

  List<dynamic>? get books => _books;
  bool get isLoaded => _isLoaded;

  void test() async {
    print("Test Berhasil Dijalankan");
  }

  void getBooks() async {
    print("Get Books Berhasil Dijalankan");
    _isLoaded = true;
    notifyListeners();
    try {
      final response = await _bookService.getBooks();
      if (response.statusCode == 200) {
        _books = response.data.map((e) => BookModel.fromJson(e)).toList();
        print("Data Buku Berhasil Dimuat:");
        print(_books);
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoaded = false;
      notifyListeners();
    }
  }

  // Make addBook method
  void addBook(Map<String, dynamic> newBookData) async {
    print("Add Book Berhasil Dijalankan");
    _isLoaded = true;
    notifyListeners();
    try {
      final response = await _bookService.addBook(newBookData);
      if (response.statusCode == 201) {
        print("Buku Berhasil Ditambahkan");
        getBooks();
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoaded = false;
      notifyListeners();
    }
  }

  // Make deleteBook method
  void deleteBook(int bookId) async {
    print("Delete Book Berhasil Dijalankan");
    _isLoaded = true;
    notifyListeners();
    try {
      final response = await _bookService.deleteBook(bookId);
      if (response.statusCode == 204) {
        print("Buku Berhasil Dihapus");
        getBooks();
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoaded = false;
      notifyListeners();
    }
  }

  // Make updateBook method
  void updateBook(int bookId, Map<String, dynamic> updatedBookData) async {
    print("Update Book Berhasil Dijalankan");
    _isLoaded = true;
    notifyListeners();
    try {
      final response = await _bookService.updateBook(bookId, updatedBookData);
      if (response.statusCode == 200) {
        print("Buku Berhasil Diperbarui");
        getBooks();
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoaded = false;
      notifyListeners();
    }
  }
}

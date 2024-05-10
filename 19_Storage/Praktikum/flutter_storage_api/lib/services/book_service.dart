import 'package:dio/dio.dart';

class BookService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://ifnkdnqirwnhffptqbbu.supabase.co/rest/v1/';
  final String _apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlmbmtkbnFpcnduaGZmcHRxYmJ1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM3NzAwNzAsImV4cCI6MjAyOTM0NjA3MH0.PGHNEvC8XjTBgYstuL-7vmo4Gmw43vhCNxzzZ8FdQwI';

  Future<Response> getBooks() async {
    var baseUrl = '${_baseUrl}books?select=*&order=id.desc';
    final response = await _dio.get(
      baseUrl,
      options: Options(
        headers: {
          'apikey': _apiKey,
          'Authorization': 'Bearer $_apiKey',
        },
      ),
    );
    return response;
  }

  Future<Response> addBook(Map<String, dynamic> newBookData) async {
    var baseUrl = '${_baseUrl}books';
    final response = await _dio.post(
      baseUrl,
      data: newBookData,
      options: Options(
        headers: {
          'apikey': _apiKey,
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
          'Prefer': 'return=representation',
        },
      ),
    );
    return response;
  }

  Future<Response> deleteBook(int bookId) async {
    var baseUrl = '${_baseUrl}books?id=eq.$bookId';
    final response = await _dio.delete(
      baseUrl,
      options: Options(
        headers: {
          'apikey': _apiKey,
          'Authorization': 'Bearer $_apiKey',
        },
      ),
    );
    return response;
  }

  Future<Response> updateBook(int bookId, Map<String, dynamic> updatedBookData) async {
    var baseUrl = '${_baseUrl}books?id=eq.$bookId';
    final response = await _dio.patch(
      baseUrl,
      data: updatedBookData,
      options: Options(
        headers: {
          'apikey': _apiKey,
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
          'Prefer': 'return=representation',
        },
      ),
    );
    return response;
  }
}

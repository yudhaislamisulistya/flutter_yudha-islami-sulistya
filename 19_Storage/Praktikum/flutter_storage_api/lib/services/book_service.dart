import 'package:dio/dio.dart';

class BookService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://ifnkdnqirwnhffptqbbu.supabase.co/rest/v1/';
  final String _apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlmbmtkbnFpcnduaGZmcHRxYmJ1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM3NzAwNzAsImV4cCI6MjAyOTM0NjA3MH0.PGHNEvC8XjTBgYstuL-7vmo4Gmw43vhCNxzzZ8FdQwI';

  Future<Response> getBooks() async {
    var baseUrl = '${_baseUrl}books?select=*';
    final response = await _dio.get(
      baseUrl,
      options: Options(
        headers: {'apikey': _apiKey, 'Authorization': 'Bearer $_apiKey'},
      ),
    );
    return response;
  }
}

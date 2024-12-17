import 'package:dio/dio.dart';
import 'package:prokoders_test/models/item_model.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://675fe7cd1f7ad2426999d8bf.mockapi.io/api/v1',
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ));

  Future<List<Book>> fetchBooks() async {
    try {
      final response = await _dio.get('/book');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Book.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch books: HTTP ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(
          'Failed to fetch books: ${e.response?.statusMessage ?? e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<Book> addBook(Book book) async {
    try {
      final response = await _dio.post(
        '/book',
        data: {
          'title': book.title,
          'description': book.description,
        },
      );

      if (response.statusCode == 201) {
        return Book.fromJson(response.data);
      } else {
        throw Exception('Failed to add book: HTTP ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(
          'Failed to add book: ${e.response?.statusMessage ?? e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}

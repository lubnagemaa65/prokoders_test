import 'package:flutter/material.dart';
import 'package:prokoders_test/view/widgets/error_widget.dart';
import '../api/dio_service.dart';
import '../models/item_model.dart';

class BookProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Book> books = [];
  bool isLoading = false;

  Future<void> fetchBooks(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      books = await _apiService.fetchBooks();
    } catch (e, stackTrace) {
      // Use ErrorHandler to manage the error
      ErrorHandler.handle(
        context,
        error: e,
        stackTrace: stackTrace,
        customMessage: 'Failed to load books. Please check your connection.',
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addBook(
      BuildContext context, String title, String description) async {
    try {
      final newBook = await _apiService
          .addBook(Book(title: title, description: description));
      books.add(newBook);
      notifyListeners();
    } catch (e, stackTrace) {
      ErrorHandler.handle(
        context,
        error: e,
        stackTrace: stackTrace,
        customMessage: 'Failed to add the book. Please try again.',
      );
    }
  }
}

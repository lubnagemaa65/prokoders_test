import 'package:prokoders_test/models/item_model.dart';

class BookFactory {
  static Book createBook(String type, Map<String, dynamic> data) {
    switch (type) {
      case 'fiction':
        return Book(
          title: data['title'],
          description: data['description'],
        );

      case 'non-fiction':
        return Book(
          title: data['title'],
          description: data['description'],
        );

      case 'default':
      default:
        return Book(
          title: data['title'] ?? 'Untitled Book',
          description: data['description'] ?? 'No description available',
        );
    }
  }
}

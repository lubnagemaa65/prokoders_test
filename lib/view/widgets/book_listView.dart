import 'package:flutter/material.dart';
import 'package:prokoders_test/models/item_model.dart';

class BookListView extends StatelessWidget {
  final List<Book> books;

  const BookListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return ListTile(
          title: Text(book.title),
          subtitle: Text(book.description),
        );
      },
    );
  }
}

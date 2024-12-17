import 'package:flutter/material.dart';
import 'package:prokoders_test/core/functions/showAddItemsDialog.dart';
import 'package:prokoders_test/providers/item_provider.dart';
import 'package:prokoders_test/view/widgets/book_listView.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book List')),
      body: Consumer<BookProvider>(
        builder: (context, bookProvider, child) {
          return Skeletonizer(
            enabled: bookProvider.isLoading, // Enable skeleton during loading
            child: bookProvider.isLoading
                ? ListView.builder(
                    itemCount: 5, // Number of skeleton items
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Container(
                          height: 80,
                          color: Colors.grey[200], // Skeleton background
                        ),
                      );
                    },
                  )
                : bookProvider.books.isEmpty
                    ? const Center(child: Text('No books available.'))
                    : BookListView(books: bookProvider.books), // Display books
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddBookDialog(context); // Call the refactored function here
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

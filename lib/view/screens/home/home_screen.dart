import 'package:flutter/material.dart';
import 'package:prokoders_test/core/functions/showAddItemsDialog.dart';
import 'package:prokoders_test/view/widgets/textField.dart';
import 'package:provider/provider.dart';
import 'package:prokoders_test/providers/item_provider.dart';
import 'package:prokoders_test/view/widgets/book_listview.dart'; // Your custom list view widget

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BookProvider>(context, listen: false).fetchBooks(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book List')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.blueGrey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Consumer<BookProvider>(
          builder: (context, bookProvider, child) {
            // If data is still loading, show a loading indicator
            if (bookProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // If no books are available, show a message
            if (bookProvider.books.isEmpty) {
              return const Center(child: Text('No books available.'));
            }

            // If there are books, display them in a ListView
            return ListView.builder(
              itemCount: bookProvider.books.length,
              itemBuilder: (context, index) {
                final book = bookProvider.books[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Card(
                    color: Colors.white.withOpacity(0.9),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: const Icon(
                        Icons.book_outlined,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                      title: Text(
                        book.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        book.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.blueAccent,
                      ),
                      onTap: () {
                        // Add your action when a book is tapped
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddBookDialog(context); // Show the dialog to add a book
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

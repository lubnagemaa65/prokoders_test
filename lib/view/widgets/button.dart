import 'package:flutter/material.dart';
import 'package:prokoders_test/providers/item_provider.dart';
import 'package:provider/provider.dart';

class AddBookButton extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  const AddBookButton({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final title = titleController.text;
        final description = descriptionController.text;

        if (title.isNotEmpty && description.isNotEmpty) {
          Provider.of<BookProvider>(context, listen: false)
              .addBook(context, title, description);
        }

        Navigator.of(context).pop();
      },
      child: const Text('Add'),
    );
  }
}

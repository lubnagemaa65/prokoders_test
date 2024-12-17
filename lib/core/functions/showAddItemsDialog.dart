import 'package:flutter/material.dart';
import 'package:prokoders_test/view/widgets/button.dart';
import 'package:prokoders_test/view/widgets/textField.dart';

void showAddBookDialog(BuildContext context) {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Add New Book'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              controller: titleController,
              labelText: 'Title',
            ),
            CustomTextField(
              controller: descriptionController,
              labelText: 'Description',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          AddBookButton(
            titleController: titleController,
            descriptionController: descriptionController,
          ),
        ],
      );
    },
  );
}

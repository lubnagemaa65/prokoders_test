// import 'package:flutter/material.dart';
// import 'package:prokoders_test/providers/item_provider.dart';
// import 'package:provider/provider.dart';

// class AddItemScreen extends StatelessWidget {
//   final _titleController = TextEditingController();
//   final _descriptionController = TextEditingController();

//   AddItemScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Add Item')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _titleController,
//               decoration: const InputDecoration(labelText: 'Title'),
//             ),
//             TextFormField(
//               controller: _descriptionController,
//               decoration: const InputDecoration(labelText: 'Description'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 final provider =
//                     Provider.of<BookProvider>(context, listen: false);
//                 await provider.addItem(
//                     _titleController.text, _descriptionController.text);
//                 Navigator.pop(context);
//               },
//               child: const Text('Add Item'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

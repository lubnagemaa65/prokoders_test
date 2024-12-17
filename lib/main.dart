import 'package:flutter/material.dart';
import 'package:prokoders_test/providers/item_provider.dart';
import 'package:prokoders_test/view/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Book List',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const BookListScreen(),
      ),
    );
  }
}

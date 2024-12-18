import 'package:flutter/material.dart';
import 'package:prokoders_test/view/screens/home/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:prokoders_test/services/setup_getit.dart';
import 'package:prokoders_test/view/screens/login/login_screen.dart'; // Your main app widget

import 'package:provider/provider.dart';
import 'package:prokoders_test/providers/item_provider.dart'; // Add this for BookProvider

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Initialize widgets before other async calls

  await Supabase.initialize(
    url: 'https://wutdkopuexesuvekmlij.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind1dGRrb3B1ZXhlc3V2ZWttbGlqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ1MTIxMzQsImV4cCI6MjA1MDA4ODEzNH0.6iTpjuScWlVSlZfE_N0qQ_tPZsM4pckrlr6cW4wnXkc',
  );

  setupServiceLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prokoders Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/booklist': (context) => const BookListScreen(),
        });
  }
}

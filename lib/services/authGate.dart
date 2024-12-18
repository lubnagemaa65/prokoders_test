import 'package:flutter/material.dart';
import 'package:prokoders_test/services/subabase.dart';
import 'package:prokoders_test/view/screens/home/home_screen.dart';
import 'package:prokoders_test/view/screens/login/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final session = snapshot.hasData ? snapshot.data!.session : null;
        if (session != null) {
          return const BookListScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}

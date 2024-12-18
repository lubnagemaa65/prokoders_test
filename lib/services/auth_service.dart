import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<User?> login(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      print('Login successful: ${response.user}');
      return response.user;
    } on AuthException catch (e) {
      print('AuthException during login: ${e.message}');
      throw Exception('Login failed: ${e.message}');
    } catch (e) {
      print('Unexpected error during login: $e');
      throw Exception('Unexpected error: $e');
    }
  }

  Future<void> logout() async {
    try {
      await _supabase.auth.signOut();
      print('Logout successful');
    } catch (e) {
      print('Logout failed: $e');
      throw Exception('Logout failed: $e');
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      print('Sign-up successful: ${response.user}');
      return response.user;
    } on AuthException catch (e) {
      print('AuthException during sign-up: ${e.message}');
      throw Exception('Sign-up failed: ${e.message}');
    } catch (e) {
      print('Unexpected error during sign-up: $e');
      throw Exception('Unexpected error: $e');
    }
  }
}

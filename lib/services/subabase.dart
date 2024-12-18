import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<void> initialize() async {
    await Supabase.initialize(
        url:
            'https://wutdkopuexesuvekmlij.supabase.co', // Replace with your Supabase URL
        anonKey:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind1dGRrb3B1ZXhlc3V2ZWttbGlqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ1MTIxMzQsImV4cCI6MjA1MDA4ODEzNH0.6iTpjuScWlVSlZfE_N0qQ_tPZsM4pckrlr6cW4wnXkc');
  }
}

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<void> initialize() async {
    await Supabase.initialize(
      url:
          'https://lfpltsrvwpbsovnltdks.supabase.co', // Replace with your Supabase URL
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxmcGx0c3J2d3Bic292bmx0ZGtzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQzNDIxMjgsImV4cCI6MjA0OTkxODEyOH0.gneB-GYEI5XA-OyE_OR2leJH1UJxNifnbc7unAZ7mBQ', // Replace with your Supabase anonymous key
    );
  }
}

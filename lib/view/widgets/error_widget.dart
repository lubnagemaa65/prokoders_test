import 'package:flutter/material.dart';

class ErrorHandler {
  /// Displays an error dialog to inform the user about an issue.
  static void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Logs errors for debugging purposes (optional).
  static void logError(dynamic error, StackTrace stackTrace) {
    // Optionally integrate logging tools like Firebase Crashlytics here
    debugPrint('Error: $error\nStackTrace: $stackTrace');
  }

  /// Generic error handler for network or app-level errors.
  static void handle(
    BuildContext context, {
    required dynamic error,
    required StackTrace stackTrace,
    String? customMessage,
  }) {
    // Log the error
    logError(error, stackTrace);

    // Show user-friendly error message
    final errorMessage =
        customMessage ?? 'Something went wrong. Please try again.';
    showErrorDialog(context, errorMessage);
  }
}

import 'package:get_it/get_it.dart';
import 'package:prokoders_test/api/dio_service.dart';
import 'package:prokoders_test/providers/item_provider.dart';
import 'package:prokoders_test/services/auth_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Register ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  // Register AuthService
  getIt.registerLazySingleton<AuthService>(() => AuthService());

  // Register BookProvider (ensure it takes ApiService as a dependency)
  getIt.registerLazySingleton<BookProvider>(() => BookProvider());
}

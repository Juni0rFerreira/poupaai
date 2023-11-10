import 'package:get_it/get_it.dart';
import 'package:poupaai/features/home/home_page_controller.dart';
import 'package:poupaai/features/sign_in/sign_in_controller.dart';
import 'package:poupaai/features/sign_up/sign_up_controller.dart';
import 'package:poupaai/features/splash/splash_controoler.dart';
import 'package:poupaai/repositories/transaction_repository.dart';
import 'package:poupaai/services/auth_service.dart';
import 'package:poupaai/services/secure_storage.dart';
import 'services/firebase_auth_service.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>(() => FirebaseAuthService());

  locator.registerFactory<SplashController>(
      () => SplashController(const SecureStorage()));

  locator.registerFactory<SignInController>(
      () => SignInController(locator.get<AuthService>()));

  locator.registerFactory<SignUpController>(
      () => SignUpController(locator.get<AuthService>()));

  locator.registerFactory<TransactionRepository>(
      () => TransactionRepositoryImpl());

  locator.registerLazySingleton<HomePageController>(
      () => HomePageController(locator.get<TransactionRepository>()));
}

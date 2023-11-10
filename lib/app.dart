
import 'package:flutter/material.dart';
import 'package:poupaai/common/constants/routes.dart';
import 'package:poupaai/features/home/home_page_view.dart';
import 'package:poupaai/features/onboarding/onboarding_page.dart';
import 'package:poupaai/features/sign_in/sign_in_page.dart';
import 'package:poupaai/features/sign_up/sign_up_page.dart';
import 'package:poupaai/features/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: NamedRoutes.splash,
      routes: {
        NamedRoutes.initial:(context) => const OnboardingPage(),
        NamedRoutes.splash:(context) => const SplashPage(),
        NamedRoutes.signup:(context) => const SignUp(),
        NamedRoutes.signin:(context) => const SignIn(),
        NamedRoutes.homeview:(context) => const HomePageView(),
      },
    );
  }
}

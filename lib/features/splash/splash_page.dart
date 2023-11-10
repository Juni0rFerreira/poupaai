import 'package:flutter/material.dart';
import 'package:poupaai/common/constants/app_colors.dart';
import 'package:poupaai/common/constants/app_text_style.dart';
import 'package:poupaai/common/constants/routes.dart';
import 'package:poupaai/common/extensions/sizes.dart';
import 'package:poupaai/features/splash/splash_controoler.dart';
import 'package:poupaai/features/splash/splash_state.dart';
import 'package:poupaai/locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashController = locator.get<SplashController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => Sizes.init(context));

    Future.delayed(const Duration(seconds: 2), () {
      _splashController.isUserLogged();
      _splashController.addListener(() {
        if (_splashController.state is SplashSuccessState) {
          Navigator.pushReplacementNamed(
            context,
            NamedRoutes.homeview,
          );
        } else {
          Navigator.pushReplacementNamed(
            context,
            NamedRoutes.initial,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.greenOne, AppColors.greenTwo],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "PoupaAí",
              style: AppTextStyles.bigText50.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}

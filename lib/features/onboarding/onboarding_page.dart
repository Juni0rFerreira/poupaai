
import 'package:flutter/material.dart';
import 'package:poupaai/common/constants/app_colors.dart';
import 'package:poupaai/common/constants/app_text_style.dart';
import 'package:poupaai/common/constants/routes.dart';
import 'package:poupaai/common/widget/custom_text_button.dart';
import 'package:poupaai/common/widget/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Expanded(
              flex: 0,
              child: Image.asset('assets/img/man.png'),
            ),
            const SizedBox(height: 85.5),
            Text(
              'Spend Smarter',
              style: AppTextStyles.mediumText36
                  .copyWith(color: AppColors.greenTwo),
              textAlign: TextAlign.center,
            ),
            Text(
              'Save More',
              style: AppTextStyles.mediumText36
                  .copyWith(color: AppColors.greenTwo),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: PrimaryButton(
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.pushNamed(
                        context,
                        NamedRoutes.signup,
                        );
                  }),
            ),
            const SizedBox(height: 17),
            CustomTextButton(
              onPressed: () {Navigator.pushNamed(
                        context,
                        NamedRoutes.signin,
                        );},
              children: [
                Text(
                  'Already have account?',
                  style:
                      AppTextStyles.smallText.copyWith(color: AppColors.grey),
                ),
                Text(
                  ' Log In',
                  style: AppTextStyles.smallText
                      .copyWith(color: AppColors.greenTwo),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_style.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const PrimaryButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  final BorderRadius _borderRadius =
      const BorderRadius.all(Radius.circular(24.0));

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 64.0,
      decoration: BoxDecoration(
          borderRadius: _borderRadius,
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.greenOne, AppColors.greenTwo])),
      child: InkWell(
        borderRadius: _borderRadius,
        onTap: onPressed,
        child: Align(
          child: Text(
            text,
            style: AppTextStyles.smallText.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

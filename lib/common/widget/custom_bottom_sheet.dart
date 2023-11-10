
import 'package:flutter/material.dart';
import 'package:poupaai/common/constants/app_colors.dart';
import 'package:poupaai/common/constants/app_text_style.dart';
import 'primary_button.dart';

Future<void> customModalBottomSheet(
  BuildContext context, {
  final errorMessage,
  final buttonText,
}) async {
  return showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(38.0),
        topRight: Radius.circular(38.0),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(38.0),
            topRight: Radius.circular(38.0),
          ),
        ),
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(errorMessage,
                  style: AppTextStyles.smallText
                      .copyWith(color: AppColors.greenOne)),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: PrimaryButton(
                  text: buttonText,
                  onPressed: () => Navigator.pop(context),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

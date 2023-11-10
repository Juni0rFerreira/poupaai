import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_style.dart';

class CustomPasswordFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final String? helperText;

  const CustomPasswordFormField({
    super.key,
    this.padding,
    this.hintText,
    this.labelText,
    this.textCapitalization,
    this.controller,
    this.keyboardType,
    this.maxLength,
    this.textInputAction,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.helperText,
  });

  @override
  State<CustomPasswordFormField> createState() => _CustomPasswordFormField();
}

class _CustomPasswordFormField extends State<CustomPasswordFormField> {
  final defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.greenTwo),
  );
  bool isHidden = true;
  String? _helperText;

  @override
  void initState() {
    super.initState();
    _helperText = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            setState(() {
              _helperText = null;
            });
          } else if (value.isEmpty) {
            setState(() {
              _helperText = widget.helperText;
            });
          }
        },
        validator: widget.validator,
        style: AppTextStyles.smallText.copyWith(color: AppColors.greenOne),
        obscureText: isHidden,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
        controller: widget.controller,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          helperText: _helperText,
          helperMaxLines: 3,
          suffixIcon: InkWell(
            borderRadius: BorderRadius.circular(23.0),
            onTap: () {
              setState(() {
                isHidden = !isHidden;
              });
            },
            child: Icon(isHidden ? Icons.visibility_off : Icons.visibility),
          ),
          hintText: widget.hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText?.toUpperCase(),
          labelStyle:
              AppTextStyles.inputLabelText.copyWith(color: AppColors.lightGrey),
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(color: Colors.red)),
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}

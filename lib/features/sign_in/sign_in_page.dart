
import 'package:flutter/material.dart';
import 'package:poupaai/common/constants/app_colors.dart';
import 'package:poupaai/common/constants/app_text_style.dart';
import 'package:poupaai/common/constants/routes.dart';
import 'package:poupaai/common/utils/validator.dart';
import 'package:poupaai/common/widget/custom_bottom_sheet.dart';
import 'package:poupaai/common/widget/custom_password_form_field.dart';
import 'package:poupaai/common/widget/custom_text_button.dart';
import 'package:poupaai/common/widget/custom_text_form_field.dart';
import 'package:poupaai/common/widget/primary_button.dart';
import 'package:poupaai/features/sign_in/sign_in_state.dart';
import 'package:poupaai/locator.dart';
import 'sign_in_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<SignInController>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignInLoadingState) {
        showDialog(
            context: context,
            builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ));
      }
      if (_controller.state is SignInSuccessState) {
        Navigator.pop(context);
        Navigator.pushNamed(
                context,
                NamedRoutes.homeview,
              );
      }

      if (_controller.state is SignInErrorState) {
        final error = _controller.state as SignInErrorState;
        Navigator.pop(context);
        customModalBottomSheet(
          context,
          errorMessage: error,
          buttonText: "Tentar Novamente..",
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 66.0),
          Text(
            'Welcome back!',
            style: AppTextStyles.mediumText36
                .copyWith(color: AppColors.greenTwo),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Expanded(
            flex: 0,
            child: Image.asset('assets/img/login.png'),
          ),
          const SizedBox(height: 32.0),
          Form(
            key: _formkey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _emailController,
                  hintText: "moses@email.com",
                  labelText: "YOUR EMAIL",
                  validator: Validator.validateEmail,
                ),
                CustomPasswordFormField(
                  controller: _passwordController,
                  hintText: "123456#Abcd",
                  labelText: "YOUR PASSWORD",
                  validator: Validator.validatePassword,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: PrimaryButton(
                text: 'Sign In',
                onPressed: () {
                  final valid = _formkey.currentState != null &&
                      _formkey.currentState!.validate();
                  if (valid) {
                    _controller.signIn(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  } else {}
                }),
          ),
          Container(height: 16.0),
          CustomTextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                NamedRoutes.signup,
              );
            },
            children: [
              Text(
                'Don’t Have Account?',
                style:
                    AppTextStyles.smallText.copyWith(color: AppColors.grey),
              ),
              Text(
                ' Sign Up',
                style: AppTextStyles.smallText
                    .copyWith(color: AppColors.greenTwo),
              )
            ],
          ),
          const SizedBox(height: 52.0),
        ],
      ),
    );
  }
}

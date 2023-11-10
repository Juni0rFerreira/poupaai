
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
import 'package:poupaai/features/sign_up/sign_up_controller.dart';
import 'package:poupaai/features/sign_up/sign_up_state.dart';
import 'package:poupaai/locator.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<SignUpController>();

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
      if (_controller.state is SignUpLoadingState) {
        showDialog(
            context: context,
            builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ));
      }
      if (_controller.state is SignUpSuccessState) {
        Navigator.pop(context);
        Navigator.pushNamed(
                context,
                NamedRoutes.homeview,
              );
      }

      if (_controller.state is SignUpErrorState) {
        final errorMenssage = _controller.state as SignUpErrorState;
        Navigator.pop(context);
        customModalBottomSheet(context,
        errorMessage: errorMenssage,
        buttonText: "Tente Novamente.."
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
            'Start saving',
            style: AppTextStyles.mediumText36
                .copyWith(color: AppColors.greenTwo),
            textAlign: TextAlign.center,
          ),
          Text(
            ' Your Money!',
            style: AppTextStyles.mediumText36
                .copyWith(color: AppColors.greenTwo),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Expanded(
            flex: 0,
            child: Image.asset('assets/img/formulario.png'),
          ),
          const SizedBox(height: 32.0),
          Form(
            key: _formkey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _nameController,
                  hintText: "IRVAN MOSES",
                  labelText: "YOUR NAME",
                  validator: Validator.validateName,
                ),
                CustomTextFormField(
                  controller: _emailController,
                  hintText: "moses@email.com",
                  labelText: "YOUR EMAIL",
                  validator: Validator.validateEmail,
                ),
                CustomPasswordFormField(
                  controller: _passwordController,
                  hintText: "123456#Abcd",
                  labelText: "CHOOSE YOUR PASSWORD",
                  helperText:
                      "Must have at least eight characters, one capital letter and one number",
                  validator: Validator.validatePassword,
                ),
                CustomPasswordFormField(
                    hintText: "***********",
                    labelText: "CONFIRM YOUR PASSWORD",
                    validator: (value) => Validator.validateConfirmPassword(
                        value, _passwordController.text)),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: PrimaryButton(
                text: 'Sign Up',
                onPressed: () {
                  final valid = _formkey.currentState != null &&
                      _formkey.currentState!.validate();
                  if (valid) {
                    _controller.doSignUp(
                      name: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  } else {}
                }),
          ),
          Container(height: 16.0),
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
                ' Sign In',
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

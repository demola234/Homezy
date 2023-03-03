import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homezy/core/global/constants/app_icons.dart';
import 'package:homezy/core/global/constants/app_images.dart';
import 'package:homezy/core/global/constants/size.dart';
import 'package:homezy/core/utils/input_validation.dart';
import 'package:homezy/core/widgets/custom_text_form_field.dart';
import 'package:homezy/core/widgets/home_button.dart';
import 'package:homezy/features/authentication/presentation/login/widgets/app_header.dart';
import 'package:homezy/features/authentication/presentation/registration/widget/bottom_texts.dart';
import 'package:homezy/features/authentication/presentation/registration/widget/check_teams_and_condition.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with InputValidationMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final isHide = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: AppUserHeader(),
                ),
                const VerticalMargin(20),
                Image.asset(
                  AppImages.logo,
                  fit: BoxFit.cover,
                  width: 250,
                  height: 250,
                ),
                Text(
                  'Login Account',
                  style: Config.h1(context).copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const VerticalMargin(5.0),
                Text(
                  'please enter your email and password to continue',
                  style: Config.b3(context).copyWith(
                    color: Theme.of(context).cardColor,
                  ),
                ),
                const VerticalMargin(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: HomezyTextFormField(
                    hintText: 'Enter your email',
                    controller: _emailController,
                    inputType: TextInputType.emailAddress,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SvgPicture.asset(
                        AppIcons.email,
                        color: Theme.of(context).colorScheme.secondary,
                        height: 10,
                        width: 10,
                      ),
                    ),
                    validator: combine([
                      withMessage('email is empty', isTextEmpty),
                      withMessage('email is invalid', isInvalidEmail)
                    ]),
                  ),
                ),
                const VerticalMargin(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: HomezyTextFormField(
                    hintText: 'Enter your password',
                    controller: _passwordController,
                    obscureText: isHide.value,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isHide.value = !isHide.value;
                          });
                        },
                        child: SvgPicture.asset(
                          isHide.value ? AppIcons.eye : AppIcons.eyeOff,
                          color: Theme.of(context).colorScheme.secondary,
                          height: 10,
                          width: 10,
                        ),
                      ),
                    ),
                    validator: combine([
                      withMessage('password is empty', isTextEmpty),
                      withMessage('invalid password', isPasswordInvalid)
                    ]),
                  ),
                ),
                const VerticalMargin(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: HomezyButton(
              
                      buttonText: 'Login',
                      buttonColor: Theme.of(context).primaryColor,
                      isActive: _emailController.text != '' &&
                          _passwordController.text != '',
                      onPressed: () {
                        final isValid = _formKey.currentState!.validate();
                        if (isValid) {

                        }
                      }),
                ),
                const VerticalMargin(20),
                Container(
                  alignment: Alignment.center,
                  child: checkTeamsAndCondition(context),
                ),
                const VerticalMargin(40),
                bottomTexts(context),
                const VerticalMargin(25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homezy/core/global/constants/app_icons.dart';
import 'package:homezy/core/global/constants/size.dart';
import 'package:homezy/core/utils/input_validation.dart';
import 'package:homezy/core/widgets/custom_text_form_field.dart';
import 'package:homezy/core/widgets/home_button.dart';
import 'package:homezy/features/authentication/presentation/login/widgets/app_header.dart';
import 'package:homezy/features/authentication/presentation/registration/widget/bottom_texts.dart';

class LoginBiometrics extends ConsumerStatefulWidget {
  const LoginBiometrics({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LoginBiometricsState();
}

class _LoginBiometricsState extends ConsumerState<LoginBiometrics>
    with InputValidationMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _passwordController = TextEditingController();
  final isHide = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                  child: Column(children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: AppUserHeader(),
                ),
                const VerticalMargin(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome Back, \nUsername',
                      style: Config.h1(context).copyWith(
                        fontSize: 40,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                const VerticalMargin(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: HomezyTextFormField(
                    hintText: 'Confirm Password',
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
                      isActive: _passwordController.text != '',
                      onPressed: () {
                        final isValid = _formKey.currentState!.validate();
                        if (isValid) {}
                      }),
                ),
                const VerticalMargin(40),
                Config.isIos
                    ? SvgPicture.asset(AppIcons.faceId)
                    : SvgPicture.asset(AppIcons.fingerprint),
                const VerticalMargin(40),
                bottomTexts(context),
                const VerticalMargin(25),
              ])))),
    );
  }
}

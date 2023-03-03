import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homezy/core/global/constants/app_icons.dart';
import 'package:homezy/core/global/constants/size.dart';
import 'package:homezy/core/utils/input_validation.dart';
import 'package:homezy/core/widgets/custom_text_form_field.dart';
import 'package:homezy/core/widgets/home_button.dart';
import 'package:homezy/features/authentication/presentation/login/widgets/app_header.dart';

class ConfirmPassword extends ConsumerStatefulWidget {
  final String? email;
  const ConfirmPassword({Key? key, this.email}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConfirmPasswordState();
}

class _ConfirmPasswordState extends ConsumerState<ConfirmPassword>
    with InputValidationMixin {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final isHide = ValueNotifier<bool>(true);
  final isConfirmHide = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
                child: Form(
              key: _formKey,
              child: Column(children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: AppUserHeader(),
                ),
                const VerticalMargin(20),
                Text(
                  'Verify Password',
                  style: Config.h1(context).copyWith(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const VerticalMargin(5.0),
                Text(
                  '   Enter your password to confirm your account',
                  style: Config.b3(context).copyWith(
                    color: Theme.of(context).cardColor,
                    fontSize: 14,
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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: HomezyTextFormField(
                    hintText: 'Confirm your password',
                    controller: _confirmPasswordController,
                    obscureText: isConfirmHide.value,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isConfirmHide.value = !isConfirmHide.value;
                          });
                        },
                        child: SvgPicture.asset(
                          isConfirmHide.value ? AppIcons.eye : AppIcons.eyeOff,
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
                      buttonText: 'Confirm',
                      buttonColor: Theme.of(context).primaryColor,
                      isActive: _passwordController.text != '',
                      onPressed: () {
                        final isValid = _formKey.currentState!.validate();
                        final isPasswordMatch = _passwordController.text ==
                            _confirmPasswordController.text;
                        if (isValid && isPasswordMatch) {
                          print("heeeeeeyyy");
                        } else {
                          print("noooooo");
                        }
                      }),
                ),
              ]),
            ))));
  }
}

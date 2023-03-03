import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:homezy/core/global/constants/size.dart';
import 'package:homezy/core/routes/routes_constants.dart';
import 'package:homezy/core/utils/input_validation.dart';
import 'package:homezy/core/widgets/custom_text_form_field.dart';
import 'package:homezy/core/widgets/home_button.dart';
import 'package:homezy/core/widgets/profile_avatar.dart';
import 'package:homezy/features/authentication/presentation/login/widgets/app_header.dart';
import 'package:homezy/features/authentication/presentation/registration/widget/custom_avatar_picker.dart';
import 'package:homezy/features/authentication/presentation/registration/widget/gender_bottom_style_sheet.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen>
    with InputValidationMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final ValueNotifier<File?> _imageNotifier = ValueNotifier(null);
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: AppUserHeader(),
                ),
                const VerticalMargin(20),
                ValueListenableBuilder(
                  valueListenable: _imageNotifier,
                  builder: (context, File? image, _) {
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet<File>(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          elevation: 0,
                          builder: (context) {
                            return CustomAvatarPickerBottomSheet(
                              imageNotifier: _imageNotifier,
                            );
                          },
                        ).then((value) {
                          setState(() {
                            _imageNotifier.value = value;
                          });
                        });
                      },
                      child: ProfileAvatar(
                        fileImage: _imageNotifier.value,
                        radius: 60,
                        imageUrl: '',
                      ),
                    );
                  },
                ),
                const VerticalMargin(20),
                Text(
                  'Fill your profile',
                  style: Config.h1(context).copyWith(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const VerticalMargin(5.0),
                Text(
                  'Fill in your profile information to continue',
                  style: Config.b3(context).copyWith(
                    color: Theme.of(context).cardColor,
                    fontSize: 14,
                  ),
                ),
                const VerticalMargin(20),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: HomezyTextFormField(
                          controller: _firstNameController,
                          hintText: 'First Name',
                          inputType: TextInputType.name,
                          validator: combine([
                            withMessage('First Name is empty', isTextEmpty),
                          ]),
                        ),
                      ),
                      const VerticalMargin(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: HomezyTextFormField(
                          controller: _lastNameController,
                          hintText: 'Last Name',
                          inputType: TextInputType.name,
                          validator: combine([
                            withMessage('Last Name is empty', isTextEmpty),
                          ]),
                        ),
                      ),
                      const VerticalMargin(20),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: HomezyTextFormField(
                            controller: _phoneNumberController,
                            hintText: 'Phone Number',
                            inputType: TextInputType.phone,
                            validator: combine([
                              withMessage('Phone Number is empty', isTextEmpty),
                              withMessage('Phone Number is invalid',
                                  isInvalidPhoneNumber)
                            ]),
                          )),
                      const VerticalMargin(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: HomezyTextFormField(
                          controller: _emailController,
                          hintText: 'Email',
                          inputType: TextInputType.emailAddress,
                          validator: combine([
                            withMessage('Email is empty', isTextEmpty),
                            withMessage('email is invalid', isInvalidEmail)
                          ]),
                        ),
                      ),
                      const VerticalMargin(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: HomezyTextFormField(
                          controller: _genderController,
                          hintText: 'Gender',
                          onTap: () {
                            _pickGender(context).then((value) {
                              if (value != null) {
                                setState(() {
                                  _genderController.text = value;
                                });
                              }
                            });
                          },
                          inputType: TextInputType.text,
                          readOnly: true,
                          validator: combine([
                            withMessage('Gender is empty', isTextEmpty),
                          ]),
                        ),
                      ),
                      const VerticalMargin(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: HomezyButton(
                            buttonText: 'Login',
                            buttonColor: Theme.of(context).primaryColor,
                            onPressed: () {
                              final isValid = _formKey.currentState!.validate();
                              if (isValid) {
                                context.pushNamed(
                                  RouteConstants.verifyEmail,
                                  queryParams: <String, dynamic>{
                                    'email': _emailController.text
                                  },
                                );
                              }
                            }),
                      ),
                      const VerticalMargin(50),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> _pickGender(BuildContext context) {
    return showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      elevation: 0,
      builder: (_) {
        return const GenderBottomSheet();
      },
    );
  }
}

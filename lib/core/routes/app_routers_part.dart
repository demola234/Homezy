import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:homezy/core/cache/app_cache.dart';
import 'package:homezy/core/routes/routes_constants.dart';
import 'package:homezy/core/widgets/error_screen.dart';
import 'package:homezy/features/authentication/presentation/login/view/login.dart';
import 'package:homezy/features/authentication/presentation/registration/view/register/registration_screen.dart';
import 'package:homezy/features/authentication/presentation/registration/view/register/verify_email_otp.dart';
import 'package:homezy/features/authentication/presentation/registration/view/welcome/welcome.dart';
import 'package:homezy/features/onboarding/view/onboarding.dart';
import 'package:homezy/locator.dart';

part '../routes/app_routers.dart';

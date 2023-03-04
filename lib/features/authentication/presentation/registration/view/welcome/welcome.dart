import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:homezy/core/global/constants/app_icons.dart';
import 'package:homezy/core/global/constants/app_images.dart';
import 'package:homezy/core/global/constants/size.dart';
import 'package:homezy/core/routes/routes_constants.dart';
import 'package:homezy/core/services/oauth/facebook_auth.dart';
import 'package:homezy/core/services/oauth/google_sign_in.dart';
import 'package:homezy/core/utils/loading_overlay.dart';
import 'package:homezy/core/widgets/social_buttons.dart';
import 'package:homezy/features/authentication/presentation/registration/widget/bottom_texts.dart';
import 'package:homezy/features/authentication/presentation/registration/widget/check_teams_and_condition.dart';

import '../../../../../../core/widgets/home_button.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen>
    with LoadingOverlayMixin {
  OverlayEntry? _overlayEntry;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const VerticalMargin(50),
                Image.asset(
                  AppImages.logo,
                  fit: BoxFit.cover,
                  width: 300,
                  height: 300,
                ),
                // const VerticalMargin(10),
                Text(
                  'Lets get started!',
                  style: Config.h1(context).copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const VerticalMargin(5.0),
                Text(
                  'We are glad to have you on board',
                  style: Config.b3(context).copyWith(
                    color: Theme.of(context).cardColor,
                  ),
                ),
                const VerticalMargin(30),

                SocialButtons(
                  color: Theme.of(context).primaryColor,
                  icon: AppIcons.email,
                  text: 'Continue with Email',
                  textColor: Theme.of(context).textTheme.headline1!.color!,
                  onTap: () {
                    context.pushNamed(RouteConstants.login);
                  },
                  borderColor: Colors.transparent,
                ),

                const VerticalMargin(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      const HorizontalMargin(20),
                      Expanded(
                        child: Divider(
                          color: Theme.of(context).cardColor,
                          thickness: 1,
                        ),
                      ),
                      const HorizontalMargin(30),
                      Text(
                        'or',
                        style: Config.b2(context).copyWith(
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                      const HorizontalMargin(30),
                      Expanded(
                        child: Divider(
                          color: Theme.of(context).cardColor,
                          thickness: 1,
                        ),
                      ),
                      const HorizontalMargin(30),
                    ],
                  ),
                ),

                const VerticalMargin(40),
                SocialButtons(
                  color: Theme.of(context).backgroundColor,
                  icon: AppIcons.google,
                  text: 'Continue with Google',
                  textColor: Theme.of(context).textTheme.headline2!.color!,
                  onTap: () async {
                    _overlayEntry = showLoadingOverlay(context, _overlayEntry);
                    await Future.delayed(const Duration(seconds: 2), () {
                      _overlayEntry?.remove();
                    });
                    final token = await GoogleAuthHandler.signInWithGoogle();
                    // await GoogleAuthHandler.signOutGoogle();
                    debugPrint(token.toString());
                  },
                  borderColor: Theme.of(context).cardColor,
                ),
                const VerticalMargin(30),
                SocialButtons(
                  color: Theme.of(context).primaryColor,
                  icon: AppIcons.facebook,
                  text: 'Continue with Facebook',
                  textColor: Theme.of(context).textTheme.headline1!.color!,
                  onTap: () async {
                    _overlayEntry = showLoadingOverlay(context, _overlayEntry);
                    await Future.delayed(const Duration(seconds: 2), () {
                      _overlayEntry?.remove();
                    });
                    final token = await FbAuthHandler.login();
                    print(token);
                  },
                  borderColor: Colors.transparent,
                ),
                const VerticalMargin(25),
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homezy/core/global/constants/size.dart';
import 'package:homezy/core/routes/routes_constants.dart';

Row bottomTexts(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Don’t have an account?',
        style: Config.b2(context).copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      const HorizontalMargin(5),
      InkWell(
        onTap: () {
          context.pushNamed(RouteConstants.register);
        },
        child: Text(
          'Sign Up',
          style: Config.b2(context).copyWith(
            fontSize: 13,
            color: Theme.of(context).colorScheme.primary,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

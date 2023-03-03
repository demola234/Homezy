import 'package:flutter/material.dart';
import 'package:homezy/core/global/constants/size.dart';

Text checkTeamsAndCondition(BuildContext context) {
  return Text.rich(
    textAlign: TextAlign.center,
    TextSpan(
      children: [
        TextSpan(
          text: 'By continuing, you are acknowledging \nour ',
          style: Config.b2(context).copyWith(
            fontSize: 12,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        TextSpan(
          text: 'terms ',
          style: Config.b2(context).copyWith(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
        TextSpan(
          text: 'and ',
          style: Config.b2(context).copyWith(
            fontSize: 12,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        TextSpan(
          text: 'privacy policy',
          style: Config.b2(context).copyWith(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    ),
  );
}

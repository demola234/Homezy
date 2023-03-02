import 'package:flutter/material.dart';
import 'package:homezy/core/global/constants/app_images.dart';
import 'package:homezy/core/global/constants/size.dart';

class OnboardingBackground extends StatelessWidget {
  const OnboardingBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.screenWidth(),
          height: 380,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                AppImages.onboardingBg,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

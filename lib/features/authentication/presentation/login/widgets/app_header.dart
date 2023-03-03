import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:homezy/core/global/constants/app_icons.dart';
import 'package:homezy/core/global/constants/size.dart';

class AppUserHeader extends StatelessWidget {
  const AppUserHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
              vertical: 5,
            ),
            child: GestureDetector(
              onTap: () => context.pop(),
              child: SvgPicture.asset(
                AppIcons.arrowLeft,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          const VerticalMargin(10),
        ],
      ),
    );
  }
}

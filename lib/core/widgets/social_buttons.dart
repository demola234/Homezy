// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homezy/core/global/constants/size.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
    required this.color,
    required this.text,
    required this.icon,
    required this.textColor,
    required this.borderColor,
    required this.onTap,
  });
  final Color color;
  final String text;
  final String icon;
  final Color textColor;
  final void Function()? onTap;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        height: 58,
        width: context.screenWidth(),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: Config.b3(context).copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const HorizontalMargin(7),
              SvgPicture.asset(icon),
            ],
          ),
        ),
      ),
    );
  }
}

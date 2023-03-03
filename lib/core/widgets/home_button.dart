import 'package:flutter/material.dart';
import 'package:homezy/core/global/constants/size.dart';


class HomezyButton extends StatelessWidget {
  const HomezyButton({
    super.key,
    this.width,
    this.buttonColor = Colors.black,
    this.onPressed,
    this.isActive = true,
    this.isLoading = false,
    this.buttonText = 'Continue',
    this.height,
    this.textColor = Colors.white,
  });

  final String buttonText;
  final bool isLoading;
  final double? width;
  final Color? textColor;

  /// Defaults to 36.0 from the [ButtonTheme]
  final double? height;
  final Color buttonColor;
  final bool? isActive;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 0,
        onPressed: isActive!
            ? !isLoading
                ? onPressed
                : null
            : null,
        disabledColor: Theme.of(context).cardColor,
        color: (onPressed != null)
            ? isActive!
                ? buttonColor
                : Theme.of(context).primaryColor
            : buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        minWidth: width ?? double.infinity,
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
                buttonText,
                style: Config.b2(context).copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              )
           
              );
  }
}

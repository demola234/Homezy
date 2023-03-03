import 'package:flutter/material.dart';

enum ThemeOptions {
  Light,
  Dim,
  Dark,
}

class AppTheme {
  static final themeOptions = {
    ThemeOptions.Light: ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xFF3062C8),
      backgroundColor: Color(0xFFFFFFFF),
      cardColor: Color(0xFFBABABA),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        headline2: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Color(0xFF000000),
        ),
        headline3: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color(0xFF000000),
        ),
        headline4: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF000000),
        ),
        headline5: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Color(0xFF000000),
        ),
        headline6: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(0xFF000000),
        ),
        subtitle1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFF000000),
        ),
        subtitle2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF000000),
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFF000000),
        ),
        bodyText2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF000000),
        ),
        button: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Color(0xFF000000),
        ),
        caption: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFF000000),
        ),
        overline: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Color(0xFF000000),
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSwatch(accentColor: Colors.black)
          .copyWith(secondary: Color(0xFF000000), error: Colors.red),
    ),
    ThemeOptions.Dim: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue,
      accentColor: Color(0xFF8899A6),
      backgroundColor: Color(0xFF10171E),
      scaffoldBackgroundColor: Color(0xFF15202B),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    ThemeOptions.Dark: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      primarySwatch: Colors.blue,
      accentColor: Color(0xFF7A8087),
      backgroundColor: Color(0xFF202327),
      scaffoldBackgroundColor: Colors.black,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  };
}

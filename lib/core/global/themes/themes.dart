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
      primarySwatch: Colors.blue,
      primaryColor: Color(0xFF3062C8),
      accentColor: Colors.black54,
      backgroundColor: Color(0xFFFFFFFF),
      cardColor: Color(0xFFBABABA),
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
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

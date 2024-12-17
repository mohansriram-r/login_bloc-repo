import 'package:flutter/material.dart';
import 'package:login_bloc/utils/theme/custom_theme_data/text_theme.dart';

class CTheme {
  CTheme._();

  static ThemeData themeData = ThemeData(
    fontFamily: 'Poppins',
    textTheme: CTextTheme.textTheme,
  );
}

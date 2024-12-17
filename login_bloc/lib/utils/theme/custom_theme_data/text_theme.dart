import 'package:flutter/material.dart';

class CTextTheme {
  CTextTheme._();

  static TextTheme textTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );
}

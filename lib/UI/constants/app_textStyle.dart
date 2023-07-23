import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle headline1(BuildContext context) {
    return GoogleFonts.urbanist(
      textStyle: Theme.of(context).textTheme.headlineLarge,
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle headline2(BuildContext context) {
    return GoogleFonts.urbanist(
      textStyle: Theme.of(context).textTheme.headlineMedium,
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    );
  }

  static TextStyle headline2Black(BuildContext context) {
    return GoogleFonts.urbanist(
      textStyle: Theme.of(context).textTheme.headlineMedium,
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    );
  }

  static TextStyle bodyText1Whit(BuildContext context) {
    return GoogleFonts.urbanist(
      textStyle: Theme.of(context).textTheme.bodyLarge,
      fontSize: 16,
      color: Colors.white,
    );
  }

  static TextStyle bodyText1Black(BuildContext context) {
    return GoogleFonts.urbanist(
      textStyle: Theme.of(context).textTheme.bodyLarge,
      fontSize: 16,
      color: Colors.black,
    );
  }

  static TextStyle bodyText2White(BuildContext context) {
    return GoogleFonts.urbanist(
      textStyle: Theme.of(context).textTheme.bodyMedium,
      fontSize: 14,
      color: Colors.white,
    );
  }

  static TextStyle bodyText2Black(BuildContext context) {
    return GoogleFonts.urbanist(
      textStyle: Theme.of(context).textTheme.bodyMedium,
      fontSize: 14,
      color: Colors.black54,
    );
  }

  // Add more text styles as needed...
}

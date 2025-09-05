import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static const Color primaryColor = Color(0xFFF4D644);
  static const Color secondaryColor = Color(0xFF2A2A36);
  static const Color accentColor = Color(0xFFFFC107);
  static const Color backgroundColor = Color(0xFFF8F9FA);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      background: backgroundColor,
    ),
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: _customTextTheme,
    appBarTheme: _appBarTheme,
    buttonTheme: _buttonTheme,
    iconTheme: _iconTheme,
  );

  static final TextTheme _customTextTheme = TextTheme(
    displayLarge: const TextStyle(
      fontSize: 60.0,
      fontWeight: FontWeight.w500,
      color: secondaryColor,
      //letterSpacing: -1.5,
    ),
    displayMedium: const TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.w500,
      color: secondaryColor,
    ),
    displaySmall: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: secondaryColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: secondaryColor.withOpacity(0.8),
      height: 1.6,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: secondaryColor.withOpacity(0.8),
      height: 1.6,
    ),
  );

  static const AppBarTheme _appBarTheme = AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: primaryColor),
  );

  static const ButtonThemeData _buttonTheme = ButtonThemeData(
    buttonColor: secondaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  );

  static const IconThemeData _iconTheme = IconThemeData(
    color: secondaryColor,
    size: 24.0,
  );

  static final LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, secondaryColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

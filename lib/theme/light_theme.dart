import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  static ThemeData lightTheme({ColorScheme? dynamicColorScheme}) {
    ColorScheme colorScheme = dynamicColorScheme ??
        ColorScheme.fromSeed(
          seedColor: const Color(0xFF377D71),
        );
    return ThemeData.light(
      useMaterial3: true,
    ).copyWith(
      colorScheme: colorScheme,
      textTheme: GoogleFonts.trispaceTextTheme(),
    );
  }
}

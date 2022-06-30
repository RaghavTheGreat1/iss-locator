import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkTheme {
  static ThemeData darkTheme({ColorScheme? dynamicColorScheme}) {
    ColorScheme colorScheme = dynamicColorScheme ??
        ColorScheme.fromSeed(
          seedColor: const Color(0xFF377D71),
          brightness: Brightness.dark,
        );
    return ThemeData.dark(
      useMaterial3: true,
    ).copyWith(
      colorScheme: colorScheme,
      textTheme: GoogleFonts.trispaceTextTheme().apply(
        bodyColor: Colors.white,
      ),
    );
  }
}

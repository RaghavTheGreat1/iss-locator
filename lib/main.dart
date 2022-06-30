import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:iss_locator/screens/home/home_screen.dart';
import 'package:iss_locator/services/iss_locator.dart';
import 'package:iss_locator/theme/dark_theme.dart';
import 'package:iss_locator/theme/light_theme.dart';

void main() async {
  await IssLocator.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        return MaterialApp(
          title: 'ISS Locator',
          theme: LightTheme.lightTheme(dynamicColorScheme: lightColorScheme),
          darkTheme: DarkTheme.darkTheme(dynamicColorScheme: darkColorScheme),
          home: const HomeScreen(),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.interTextTheme(),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2DA67A),
        surface: Colors.white,
        outline: const Color(0xFFE9EDF0),
      ),
    );

    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const HomeScreen(),
    );
  }
}

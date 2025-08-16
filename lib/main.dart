import 'package:animated_drawer/screens/home_screen_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7F5AF0),
          brightness: Brightness.light,
          primary: const Color(0xFF7F5AF0),
          secondary: const Color(0xFF2CB67D),
          tertiary: const Color(0xFFF582AE),
          surfaceTint: Colors.transparent,
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.outfit().fontFamily,
        scaffoldBackgroundColor: const Color(0xFFF9FAFB),
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7F5AF0),
          brightness: Brightness.dark,
          primary: const Color(0xFF7F5AF0),
          secondary: const Color(0xFF2CB67D),
          tertiary: const Color(0xFFF582AE),
          background: const Color(0xFF16161A),
          surface: const Color(0xFF242629),
          surfaceTint: Colors.transparent,
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.outfit().fontFamily,
        scaffoldBackgroundColor: const Color(0xFF16161A),
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const HomeScreen2(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const seedColor = Color.fromARGB(255, 7, 80, 50);
const darkBlue = Color(0xFF1E1E2C);

class AppTheme {
  ThemeData get getTheme => ThemeData(
        useMaterial3: true,
        // primaryColor: darkBlue,
        colorSchemeSeed: seedColor,
        // colorScheme: const ColorScheme.dark(
        //   primary: darkBlue,
        //   background: Colors.black12,
        // ),
        listTileTheme: const ListTileThemeData(iconColor: seedColor),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.montserratAlternates(),
          titleMedium: GoogleFonts.russoOne(fontSize: 25),
        ),
      );
}

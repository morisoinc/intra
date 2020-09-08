import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  primaryColorDark: const Color(0xFF80A1D4),
  primaryColorLight: const Color(0xFFF7F4EA),
  primaryColor: const Color(0xFFC0B9DD),
  accentColor: const Color(0xFF009688),
  scaffoldBackgroundColor: const Color(0xFFF7F4EA),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
    ),
  ),
);

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const blue4 = Color(0xFF459CFF);
const blue3 = Color(0xFF9FCBFC);
const blue2 = Color(0xFFD0E6FF);
const blue1 = Color(0xFFE8F3FF);

const purple4 = Color(0xFFAE6CF8);
const purple3 = Color(0xFFC7B0FB);
const purple2 = Color(0xFFE3D7FD);
const purple1 = Color(0xFFF1EBFE);

const yellow3 = Color(0xFFFCDD7D);
const yellow2 = Color(0xFFFDE59D);
const yellow1 = Color(0xFFFEF7DF);

const black2 = Color(0xFF474C61);
const black1 = Color(0xFF948F9B);

const gray2 = Color(0xFFE1DEE9);
const gray1 = Color(0xFFECE9F4);

const white3 = Color(0xFFFCFCFC);
const white2 = Color(0xFFF3F5FE);


final theme = ThemeData(
  fontFamily: 'Inter',
  primaryColorDark: purple4,
  primaryColorLight: purple3,
  primaryColor: purple2,
  accentColor: blue4,
  scaffoldBackgroundColor: white3,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
    ),
  ),
);

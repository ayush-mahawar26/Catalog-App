// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData get themeData => ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: GoogleFonts.lato().fontFamily,
              fontWeight: FontWeight.bold),
        ),
        fontFamily: GoogleFonts.lato().fontFamily,
        primarySwatch: Colors.deepPurple,
      );
}

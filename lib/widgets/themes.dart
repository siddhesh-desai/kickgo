import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
          color: Color(0xffffc107),
          elevation: 5,
          iconTheme: IconThemeData(
            color: Color(0xff295e2b),
          ),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      );
}

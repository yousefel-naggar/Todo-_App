import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF5D9CEC),
          onPrimary: Color(0xFF383838),
          secondary: Colors.white,
          onSecondary: Color(0xFFCDCACA),
          error: Colors.red,
          onError: Colors.grey,
          background: Colors.white,
          onBackground: Color(0xFF61E757),
          surface: Colors.white,
          onSurface: Color(0xFFA9A9A9)),
      scaffoldBackgroundColor: Color(0xFFDFECDB),
      appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF5D9CEC),
          titleTextStyle: GoogleFonts.poppins(fontSize: 22.sp)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF5D9CEC),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ));
}

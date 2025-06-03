import 'package:flutter/material.dart';
import 'package:frontend_interview_task/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.bottomNavBackgroundColor,
    ),
    textTheme: GoogleFonts.montserratTextTheme(),
  );
}

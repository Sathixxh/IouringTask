import 'package:flutter/material.dart';
import 'package:iouringtask/core/Themes/stylecolors.dart';

class AppTheme {
  static ThemeData Darkmode(BuildContext context) {
    return ThemeData.dark().copyWith(
    
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: ColorPallete.dark_textcolor),
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorPallete.dark_secondaryColor)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          filled: true,
          fillColor: ColorPallete.dark_Secondary_bgColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
            progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: ColorPallete.dark_secondaryColor),
        tabBarTheme: const TabBarTheme(
            indicatorColor: Colors.green,
            labelColor: Colors.green,
            dividerColor: Colors.transparent),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            showUnselectedLabels: true,
            backgroundColor: ColorPallete.dark_Secondary_bgColor,
            selectedItemColor: ColorPallete.dark_secondaryColor,
            unselectedItemColor: ColorPallete.dark_textcolor),
        textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 22),
            bodyLarge: TextStyle(fontSize: 16),
            bodyMedium: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 12)));
  }
}
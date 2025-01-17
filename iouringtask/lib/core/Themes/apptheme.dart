import 'package:flutter/material.dart';
import 'package:iouringtask/core/Themes/stylecolors.dart';

class AppTheme {
  static ThemeData Darkmode(BuildContext context) {
    return ThemeData.dark().copyWith(
    
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: ColorsPallete.darkmodetextcolor),
          contentPadding: const EdgeInsets.symmetric(vertical: 5,),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorsPallete.darkmode_secondaryColor)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          filled: true,
          fillColor: ColorsPallete.darkmode_SecondarybgColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
            progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: ColorsPallete.darkmode_secondaryColor),
        tabBarTheme: const TabBarTheme(
            indicatorColor: Colors.green,
            labelColor: Colors.green,
            dividerColor: Colors.transparent),
                textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 22),
            bodyLarge: TextStyle(fontSize: 16),
            bodyMedium: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 12)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            showUnselectedLabels: true,
            backgroundColor: ColorsPallete.darkmode_SecondarybgColor,
            selectedItemColor: ColorsPallete.darkmode_secondaryColor,
            unselectedItemColor: ColorsPallete.darkmodetextcolor),
    );
  }
}
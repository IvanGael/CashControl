import 'package:cash_control/constants/colors.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  ThemeData lightTheme = ThemeData(
    fontFamily: "PetrovSans",
    useMaterial3: true,
    primaryColor: AppColors.color3,
    visualDensity: VisualDensity.adaptivePlatformDensity, 
    colorScheme: ColorScheme.light(
      primary: AppColors.color4, 
      secondary: AppColors.color4
    ).copyWith(background: AppColors.color8)
  );

  ThemeData darkTheme = ThemeData(
    fontFamily: "PetrovSans",
    useMaterial3: true,
    primaryColor: AppColors.color4,
    visualDensity: VisualDensity.adaptivePlatformDensity, 
    colorScheme: ColorScheme.light(
      primary: AppColors.color5, 
      secondary: AppColors.color7,
    ).copyWith(background: AppColors.color4)
  );
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'constants.dart';

ThemeData light_theme(){
  return ThemeData(
    textTheme: lightTextTheme(),
    scaffoldBackgroundColor: AppColors.lightColor,
    appBarTheme:const AppBarTheme(
      elevation: AppSizes.elevationBarSize,
      color: AppColors.lightColor,
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        color: AppColors.darkColor,
        size: AppSizes.iconBarSize,
      ),
      iconTheme: IconThemeData(
        color: AppColors.lightColor,
        size: AppSizes.iconSize,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: AppColors.lightColor,
        statusBarIconBrightness:Brightness.dark,
        systemNavigationBarColor: AppColors.lightColor,

      ),
    ),
  );
}

ThemeData dark_theme(){
  return ThemeData(
    textTheme: darkTextTheme(),
    scaffoldBackgroundColor: AppColors.darkColor,
    appBarTheme:const AppBarTheme(
      elevation: AppSizes.elevationBarSize,
      color: AppColors.blackColor,
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        color: AppColors.lightColor,
        size: AppSizes.iconBarSize,
      ),
      iconTheme: IconThemeData(
        color: AppColors.lightColor,
        size: AppSizes.iconSize,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.blackColor,
        statusBarIconBrightness:Brightness.light,
        systemNavigationBarColor: AppColors.blackColor,

      ),
    ),
  );
}


TextTheme lightTextTheme() {
  return const TextTheme(
    headline1: TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),
    headline2: TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    headline3: TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    headline4: TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    headline5: TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    headline6: TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    bodyText1: TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    ),
    bodyText2: TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.normal,
      fontSize: 10,
    ),
  );
}

TextTheme darkTextTheme() {
  return const TextTheme(
    headline1: TextStyle(
      color: AppColors.lightColor,
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),
    headline2: TextStyle(
      color: AppColors.lightColor,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    headline3: TextStyle(
      color: AppColors.lightColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    headline4: TextStyle(
      color: AppColors.lightColor,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    headline5: TextStyle(
      color: AppColors.lightColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    headline6: TextStyle(
      color: AppColors.lightColor,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    bodyText1: TextStyle(
      color: AppColors.lightColor,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    ),
    bodyText2: TextStyle(
      color: AppColors.lightColor,
      fontWeight: FontWeight.normal,
      fontSize: 10,
    ),
  );
}


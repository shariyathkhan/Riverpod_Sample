import 'package:flutter/material.dart';
import 'package:flutter_ar/utils/colors.dart';

ThemeData appTheme() => ThemeData(
    primaryColor: Colors.white,
    // accentColor: const Color(0xFF2B65F0),
    fontFamily: 'NotoSans',
    appBarTheme: const AppBarTheme(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    ),
    scaffoldBackgroundColor: AppColors.dialogBG,
    visualDensity: VisualDensity.adaptivePlatformDensity,

    //TextTheme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.bold, color: AppColors.black),
    ));

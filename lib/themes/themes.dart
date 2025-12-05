import 'package:flutter/material.dart';
import 'package:im_feeling_quite_hungry/ifqh.dart';

final ThemeData lightTheme = ThemeData(
  primaryColorLight: lightThemeLightShade,
  primaryColorDark: lightThemeDarkShade,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme().copyWith(
    bodyMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black
    ),
  )
);

final ThemeData darkTheme = ThemeData(
  primaryColorLight: darkThemeLightShade,
  primaryColorDark: darkThemeDarkShade,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
  dividerColor: darkThemeLightShade,
  textTheme: TextTheme().copyWith(
    bodyMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white
    ),
  )
);
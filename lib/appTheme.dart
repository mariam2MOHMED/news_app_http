import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme{
  static Color primary=Color(0xFF39A552);
  static Color navy=Color(0xFF4F5A69);
  static Color grey=Color(0xFF79828B);
  static Color red=Color(0xFFC91C22);
  static Color black=Color(0xFF303030);
  static Color white=Color(0xFFFFFFFF);
  //003E90
  static Color blue=Color(0xFF003E90);
  static Color pink=Color(0xFFED1E79);
  static Color brown=Color(0xFFCF7E48);
  static Color lightblue=Color(0xFF4882CF);
  //#303030
  static Color yellow=Color(0xFFF2D352);
  static ThemeData lightTheme=ThemeData(

    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: white
      ),
      backgroundColor: primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.zero,
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50)
        )
      ),
      centerTitle: true,

      titleTextStyle: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w400,
        color: white
      )
    ),
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,color: black
      ),
      headlineLarge: TextStyle(
        color: black,
        fontSize: 24,
        fontWeight: FontWeight.w700
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: navy
      ),

      titleMedium: TextStyle(
        fontWeight: FontWeight.w400,fontSize: 22,
        color: white
      )
    )
  );
  static ThemeData darkTheme=ThemeData();
}
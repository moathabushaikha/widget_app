import 'package:flutter/material.dart';
import 'my_colors.dart';

class AppTheme
{
  static ThemeData AppThemeOrange(BuildContext context)
  {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: MyColors.myOrange,
      backgroundColor: MyColors.myBlue1,
      textTheme: myTextTheme(context)
    );
  }
  static TextTheme myTextTheme(BuildContext context)
  {
    return  const TextTheme(
      headlineSmall: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),
      bodySmall: TextStyle(fontSize: 18,fontStyle: FontStyle.normal,fontWeight: FontWeight.bold),
    );
  }
}
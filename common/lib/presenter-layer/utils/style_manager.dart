import 'package:flutter/material.dart';

class StyleManager {
  StyleManager._();

  /// This is the style for the header green text of the app
  static TextStyle headerTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 28.0,
    fontWeight: FontWeight.w800,
  );

  /// This is the style for the general black text of the app. It is customizable by providing
  /// font weight and font size parameter.
  static TextStyle blackTextStyle(
      {FontWeight fontWeight = FontWeight.w600,
      double fontSize = 16.0,
      double lineHeight = 1}) {
    return TextStyle(
        color: Colors.black,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: lineHeight);
  }


  /// This is the style for the general grey text of the app. It is customizable by providing
  /// font weight and font size parameter.
  static TextStyle greyTextStyle(
      {FontWeight fontWeight = FontWeight.w600,
        double fontSize = 16.0,
        double lineHeight = 1}) {
    return TextStyle(
        color: Colors.grey,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: lineHeight);
  }
}

import 'package:flutter/material.dart';

extension DarkMood on BuildContext {
  bool get isDarkMood {
    return Theme.of(this).brightness == Brightness.dark;
  }
      
}
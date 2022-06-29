import 'package:flutter/material.dart';

//* Global Theme
ThemeData theme = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(16.0),
    hintStyle: const TextStyle(
      fontSize: 16.0,
      color: Color(0xffBDBDBD),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        width: 1.0,
        color: Color(0xffE8E8E8),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        width: 1.0,
        color: Colors.red,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        width: 2.0,
        color: Colors.red,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        width: 1.0,
        color: Color(0xffE8E8E8),
      ),
    ),
    filled: true,
  ),
  fontFamily: 'Inter',
);

//* Constant properties
List<String> opinion = ['Flutter is greate!', 'Flutter is awesome', 'Other'];
DateTime currenTDate = DateTime.now();
String passwordRegx = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$';

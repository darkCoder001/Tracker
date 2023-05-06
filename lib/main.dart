import 'package:flutter/material.dart';
import './widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Color(0xFFe52165),);
var kColorScheme2 = ColorScheme.fromSeed(seedColor: Color(0xFF0d1137),);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Color(0xFF0d1137),
          foregroundColor: kColorScheme.primary
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal:16, vertical: 8)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme2.secondaryContainer
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 14
            )
        )
        ),
      home: const Expenses(),
    )
  );
}



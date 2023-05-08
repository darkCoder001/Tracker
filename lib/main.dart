import 'package:flutter/material.dart';
import './widgets/expenses.dart';
// import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Color(0xFF1e3d59),);
var kColorScheme2 = ColorScheme.fromSeed(seedColor: Color(0xFFf5f0e1),);

var kdarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color(0xFF0d1137) );

var kdarkColorScheme2 = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color(0xFFf3ca20)
  );

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
    runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kdarkColorScheme,
         cardTheme: const CardTheme().copyWith(
          color: Color(0xFF12a4d9).withOpacity(0.5),
          margin: const EdgeInsets.symmetric(horizontal:16, vertical: 8)
        ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
            backgroundColor: kdarkColorScheme2.secondaryContainer,
            foregroundColor: kdarkColorScheme2.onPrimaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kdarkColorScheme2.onSecondaryContainer,
            fontSize: 16
            ),
            titleMedium: TextStyle( 
            fontWeight: FontWeight.normal,
            color:  kdarkColorScheme2.onSecondaryContainer,
            fontSize: 14
            )
        ),
         appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Color(0xFF000000),
          foregroundColor: kdarkColorScheme2.primary
        ),
        scaffoldBackgroundColor: Color(0xFF000000).withOpacity(0.75)
        ),
      theme: ThemeData().copyWith(useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Color(0xFFf5f0e1),
          foregroundColor: kColorScheme.primary
        ),
        cardTheme: const CardTheme().copyWith(
          color: Color(0xFF1e3d59).withOpacity(0.5),
          margin: const EdgeInsets.symmetric(horizontal:16, vertical: 8)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme2.secondaryContainer
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1e3d59),
            fontSize: 16
            ),
            titleMedium: const TextStyle( 
            fontWeight: FontWeight.normal,
            color: Color(0xFF1e3d59),
            fontSize: 14
            )
        ),
        scaffoldBackgroundColor: Color(0xFFf5f0e1).withOpacity(0.95),
        ),
        themeMode: ThemeMode.system,
      home: const Expenses(),
    )
  );
  // });
  
}



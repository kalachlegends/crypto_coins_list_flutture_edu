import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: Color.fromARGB(255, 43, 43, 43),
  dividerColor: Colors.white24,
  appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 43, 43, 43),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 24,
      )),
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 251, 255, 4)),
  primarySwatch: Colors.yellow,
  useMaterial3: true,
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  cardTheme: const CardTheme(
    color: Color.fromARGB(255, 43, 43, 43),
    
  ),
  textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white, fontSize: 20),
      bodyLarge: TextStyle(color: Colors.white, fontSize: 20),
      bodySmall: TextStyle(color: Colors.white)),
);

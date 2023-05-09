import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.orange,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkmode;

  AppTheme({
    this.isDarkmode = false,
    this.selectedColor = 0,
  })  : assert(selectedColor >= 0, 'Selected color must be greater than 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: true),
      );

  ///Crear una nueva instancia de la clase
  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkmode,
  }) =>
      AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkmode: isDarkmode ?? this.isDarkmode,
      );
}

import 'package:flutter/material.dart';

abstract class AppTheme {
  const AppTheme();

  ColorScheme get lightColorScheme;
  ColorScheme get darkColorScheme;

  TextTheme? get textTheme => null;

  ThemeData get dark => _buildTheme(darkColorScheme);
  ThemeData get light => _buildTheme(lightColorScheme);

  ThemeData _buildTheme(ColorScheme scheme) {
    return ThemeData(
      colorScheme: scheme,
      textTheme: textTheme,
    );
  }

  factory AppTheme.formColor([Color color = Colors.indigo]) => _AppTheme(color);
}

class _AppTheme extends AppTheme {
  final Color color;

  const _AppTheme(this.color);

  @override
  ColorScheme get darkColorScheme => ColorScheme.fromSeed(
        seedColor: color,
        brightness: Brightness.dark,
      );

  @override
  ColorScheme get lightColorScheme => ColorScheme.fromSeed(
        seedColor: color,
        brightness: Brightness.light,
      );
}

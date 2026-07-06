import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const _pastelPurple = Color(0xFFB8A5D6);
  static const _pastelGreen = Color(0xFFA8D8B9);

  static const _darkPurple = Color(0xFF6B5A8E); 
  static const _darkGreen = Color(0xFF4C8563);

  static const _background = Color(0xFFFAF9FC);
  static const _surface = Color(0xFFFFFFFF);
  static const _errorColor = Color(0xFFE8A0A0);

  static final ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: _pastelPurple,
    onPrimary: Colors.white,
    secondary: _pastelGreen,
    onSecondary: _darkGreen,
    error: _errorColor,
    onError: Colors.white,
    surface: _surface,
    onSurface: const Color(0xFF3A3540),
  );

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: _background,

      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontWeight: FontWeight.w600,
          color: _darkPurple,
        ),
        bodyMedium: TextStyle(color: Color(0xFF3A3540)),
        bodySmall: TextStyle(fontSize: 11, color: Color(0xFF9B96A3)),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _pastelPurple.withValues(alpha: 0.08),
        labelStyle: const TextStyle(color: _darkPurple),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _pastelGreen, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _errorColor, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _pastelPurple,
          foregroundColor: Colors.white,
          disabledBackgroundColor: _pastelPurple.withValues(alpha: 0.4),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: _darkGreen),
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return _pastelGreen;
          }
          return Colors.transparent;
        }),
        checkColor: const WidgetStatePropertyAll(Colors.white),
        side: const BorderSide(color: _pastelPurple, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: _pastelGreen,
      ),
    );
  }
}

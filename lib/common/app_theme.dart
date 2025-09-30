import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData dark() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: backgroundColor,
        canvasColor: backgroundColor,
        applyElevationOverlayColor: false,
        colorScheme: const ColorScheme.dark(
          background: backgroundColor,
          surface: cardBackgroundColor,
          primary: primaryColor,
          onBackground: textMain,
          onSurface: textMain,
          onPrimary: secondaryColor,
          error: Colors.redAccent,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          titleTextStyle:
              TextStyle(color: textMain, fontWeight: FontWeight.w700, fontSize: 18),
          iconTheme: IconThemeData(color: textMain),
        ),
        cardTheme: const CardThemeData(
          color: cardBackgroundColor,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
        ),
        dividerColor: divider,
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: textMain, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(color: textSubtle),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFF1C1D27),
          hintStyle: const TextStyle(color: textSubtle),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: divider),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: divider),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: primaryColor, width: 1.3),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: secondaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          ),
        ),
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: primaryColor),
      );
}

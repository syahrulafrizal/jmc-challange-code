import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

class AppThemes {
  static final TextTheme textTheme = TextTheme(
    displaySmall: TextStyle(
      fontSize: 11,
      color: AppColors.neutral_80,
    ),
    displayMedium: TextStyle(
      fontSize: 12,
      color: AppColors.neutral_80,
    ),
    displayLarge: TextStyle(
      fontSize: 12,
      color: AppColors.neutral_80,
    ),
    titleSmall: TextStyle(
      fontSize: 11,
      color: AppColors.neutral_80,
    ),
    titleMedium: TextStyle(
      fontSize: 12,
      color: AppColors.neutral_80,
    ),
    titleLarge: TextStyle(
      fontSize: 12,
      color: AppColors.neutral_80,
    ),
    bodyLarge: TextStyle(
      fontSize: 12,
      color: AppColors.neutral_80,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      color: AppColors.neutral_80,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: AppColors.neutral_80,
    ),
    headlineLarge: TextStyle(
      fontSize: 12,
      color: AppColors.neutral_80,
    ),
    headlineMedium: TextStyle(
      fontSize: 12,
      color: AppColors.neutral_80,
    ),
    headlineSmall: TextStyle(
      fontSize: 12,
      color: AppColors.neutral_80,
    ),
    labelLarge: TextStyle(
      fontSize: 12,
      color: AppColors.neutral_80,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      color: AppColors.neutral_80,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      color: AppColors.neutral_80,
    ),
  );

  static final ThemeData theme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.neutral_10,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.background,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      selectedLabelStyle: TextStyle(
        fontSize: 11,
        color: AppColors.primary,
        fontWeight: FontWeight.w400,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 11,
        color: AppColors.neutral_80,
        fontWeight: FontWeight.w400,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.secondaryVariant,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.primary,
        statusBarBrightness: Brightness.light,
      ),
      centerTitle: true,
      backgroundColor: AppColors.background,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.neutral_80,
        fontSize: 13,
        fontWeight: FontWeight.w700,
        wordSpacing: 1.2,
      ),
      iconTheme: IconThemeData(color: AppColors.neutral_80),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      fillColor: const Color(0xFFFFFFFF),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.primary,
          width: 1.5,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.grey,
          width: 1.5,
        ),
      ),
      filled: true,
      hintStyle: TextStyle(
        color: AppColors.neutral_40,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      labelStyle: WidgetStateTextStyle.resolveWith(
        (Set<WidgetState> states) {
          final Color color = states.contains(WidgetState.error) ? AppColors.error : AppColors.neutral_90;
          return TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          );
        },
      ),
      floatingLabelStyle: WidgetStateTextStyle.resolveWith(
        (Set<WidgetState> states) {
          final Color color = states.contains(WidgetState.error) ? AppColors.error : AppColors.primary;
          return TextStyle(
            color: color,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          );
        },
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.error,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.error,
          width: 1.5,
        ),
      ),
      errorMaxLines: 2,
      errorStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.error,
        fontSize: 10,
      ),
      isCollapsed: true,
      isDense: true,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.primary),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.white,
      disabledColor: Colors.grey.withOpacity(0.2),
      selectedColor: AppColors.primary_20,
      secondarySelectedColor: AppColors.primary_20,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      labelStyle: TextStyle(
        fontSize: 12,
        color: AppColors.neutral_80,
      ),
      side: BorderSide(color: AppColors.primary_20, width: 1.5),
      secondaryLabelStyle: const TextStyle(),
      checkmarkColor: AppColors.background,
      brightness: Brightness.light,
    ),
    iconTheme: IconThemeData(color: AppColors.neutral_80),
    popupMenuTheme: const PopupMenuThemeData(color: Colors.grey),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith(
        (states) {
          if (!states.contains(WidgetState.selected)) {
            return AppColors.neutral_50;
          }
          return AppColors.primary;
        },
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith(
        (states) {
          if (!states.contains(WidgetState.selected)) {
            return AppColors.neutral_50;
          }
          return AppColors.primary;
        },
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.primary_20,
    ).copyWith(
      error: AppColors.error,
    ),
    textTheme: textTheme,
  );

  static ThemeData lightTheme() {
    return theme;
  }

  static ThemeData darkTheme() {
    return theme;
  }

  ThemeMode init() {
    return ThemeMode.light;
  }
}

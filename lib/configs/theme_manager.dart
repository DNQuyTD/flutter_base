import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
      primaryColor: LightModeColors.primaryColor,
      scaffoldBackgroundColor: LightModeColors.primaryBackground,
      appBarTheme: appBarTheme,
      iconTheme: IconThemeData(color: LightModeColors.primaryText),
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: LightModeColors.primaryText,
          displayColor: LightModeColors.primaryText),
      colorScheme: ColorScheme.light(
        primary: LightModeColors.primaryColor,
        secondary: LightModeColors.secondaryColor,
        error: LightModeColors.errorColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: LightModeColors.primaryBackground,
          selectedItemColor: LightModeColors.primaryText.withOpacity(0.7),
          unselectedItemColor: LightModeColors.primaryText.withOpacity(0.32),
          selectedIconTheme: IconThemeData(color: LightModeColors.primaryColor),
          showUnselectedLabels: true),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(GeneralColors.primaryBtnText),
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return GeneralColors.primaryColor;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return GeneralColors.primaryColor;
            }
            return null;
          }), trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return GeneralColors.primaryColor.withOpacity(0.4);
        }
        return null;
      })));
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
      primaryColor: DarkModeColors.primaryColor,
      scaffoldBackgroundColor: DarkModeColors.primaryBackground,
      appBarTheme: appBarTheme,
      iconTheme: IconThemeData(color: DarkModeColors.primaryText),
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: DarkModeColors.primaryText,
          displayColor: DarkModeColors.primaryText),
      colorScheme: ColorScheme.dark(
        primary: DarkModeColors.primaryColor,
        secondary: DarkModeColors.secondaryColor,
        error: DarkModeColors.errorColor,
        surface: DarkModeColors.primaryColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: DarkModeColors.primaryBackground,
          selectedItemColor: DarkModeColors.primaryText.withOpacity(0.7),
          unselectedItemColor: DarkModeColors.primaryText.withOpacity(0.32),
          selectedIconTheme: IconThemeData(color: DarkModeColors.primaryColor),
          showUnselectedLabels: true),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(GeneralColors.primaryBtnText),
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return GeneralColors.primaryColor;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return GeneralColors.primaryColor;
            }
            return null;
          }), trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return GeneralColors.primaryColor.withOpacity(0.4);
        }
        return null;
      })));
}

class LightModeColors with GeneralColors {
  static Color primaryColor = GeneralColors.primaryColor;
  static Color secondaryColor = GeneralColors.secondaryColor;
  static Color tertiaryColor = GeneralColors.tertiaryColor;
  static Color alternate = GeneralColors.alternate;
  static Color primaryBackground = const Color(0xFFFFFFFF);
  static Color secondaryBackground = const Color(0xFFFFFFFF);
  static Color primaryText = const Color(0xFF1D1D35);
  static Color secondaryText = const Color(0xFF57636C);

  static Color primaryBtnText = GeneralColors.primaryBtnText;
  static Color lineColor = const Color(0xFFE0E3E7);

  static Color errorColor = GeneralColors.errorColor;
}

class DarkModeColors with GeneralColors {
  static Color primaryColor = GeneralColors.primaryColor;
  static Color secondaryColor = GeneralColors.secondaryColor;
  static Color tertiaryColor = GeneralColors.tertiaryColor;
  static Color alternate = GeneralColors.alternate;
  static Color primaryBackground = const Color(0xFF1D1D35);
  static Color secondaryBackground = const Color(0xFF101213);
  static Color primaryText = const Color(0xFFF5FCF9);
  static Color secondaryText = const Color(0xFF95A1AC);

  static Color primaryBtnText = GeneralColors.primaryBtnText;
  static Color lineColor = const Color(0xFF22282F);

  static Color errorColor = GeneralColors.errorColor;
}

class GeneralColors {
  static Color primaryColor = const Color(0xFF643FDb);
  static Color secondaryColor = const Color(0xFFFE9901);
  static Color tertiaryColor = const Color(0xFFEE8B60);
  static Color alternate = const Color(0xFFFF5963);
  static Color primaryBtnText = const Color(0xFFFFFFFF);
  static Color errorColor = const Color(0xFFFF5963);
}

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
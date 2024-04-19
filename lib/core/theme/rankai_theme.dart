import 'package:flutter/material.dart';
import 'package:rankai/core/theme/extensions/text_extensions.dart';
import 'package:rankai/core/theme/rankai_palette.dart';
import 'package:rankai/core/widgets/app_sizes.dart';

final ThemeData rankaiTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: RankaiPalette.darkGrey,
    secondary: RankaiPalette.mainBlue,
  ),
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'Manrope',
  scaffoldBackgroundColor: Colors.white,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  inputDecorationTheme: _inputDecorationTheme(),
  bottomSheetTheme: const BottomSheetThemeData(
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
    ),
    backgroundColor: Colors.white,
    showDragHandle: true,
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    margin: EdgeInsets.zero,
    elevation: 0.0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Sizes.p16),
    ),
  ),
);

InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
      counterStyle: const TextStyle(color: Colors.red),
      contentPadding: const EdgeInsets.all(12),
      fillColor: Colors.white,
      errorMaxLines: 2,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: RankaiPalette.darkGrey.withOpacity(0.15),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: RankaiPalette.darkGrey,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: RankaiPalette.error,
          width: 2,
        ),
      ),
      hintStyle: RankaiTextStyles.pSmallRegular.copyWith(
        color: RankaiPalette.midGrey,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: RankaiPalette.darkGrey.withOpacity(0.15),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: RankaiPalette.darkGrey,
        ),
      ),
      errorStyle: RankaiTextStyles.pRegularRegular.copyWith(
        color: RankaiPalette.darkRed,
      ),
    );

extension AppThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

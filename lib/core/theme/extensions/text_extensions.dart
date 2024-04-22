import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:rankai/core/theme/rankai_palette.dart';

class FontWeight {
  static const ui.FontWeight thin = ui.FontWeight.w100;
  static const ui.FontWeight extraLight = ui.FontWeight.w200;
  static const ui.FontWeight light = ui.FontWeight.w300;
  static const ui.FontWeight normal = ui.FontWeight.w400;
  static const ui.FontWeight medium = ui.FontWeight.w500;
  static const ui.FontWeight semiBold = ui.FontWeight.w600;
  static const ui.FontWeight bold = ui.FontWeight.w700;
  static const ui.FontWeight extraBold = ui.FontWeight.w800;
  static const ui.FontWeight black = ui.FontWeight.w900;
}

class RankaiTextStyles {
  // Headers
  static TextStyle heading1 = TextStyle(
    fontSize: 52,
    fontWeight: FontWeight.extraBold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle heading2 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.extraBold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle heading3 = TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.extraBold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle heading4 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.extraBold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );

  // Paragraphs - Tiny
  static TextStyle pTinyExtraBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.extraBold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle pTinyBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle pTinySemiBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.semiBold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle pTinyRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );

  // Paragraphs - Small
  static TextStyle pSmallExtraBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.extraBold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle pSmallBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle pSmallSemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.semiBold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle pSmallRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );

  // Paragraphs - Regular
  static TextStyle pRegularExtraBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.extraBold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle pRegularBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle pRegularSemiBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.semiBold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle pRegularRegular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );

  // Paragraphs - Medium
  static TextStyle pMediumExtraBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.extraBold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle pMediumBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle pMediumSemiBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.semiBold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle pMediumRegular = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: RankaiPalette.mainBlue,
    height: 1.0,
  );

  // Paragraphs - Large
  static TextStyle pLargeExtraBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.extraBold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle pLargeBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle pLargeSemiBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.semiBold,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
  static TextStyle pLargeRegular = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: RankaiPalette.darkGrey,
    height: 1.0,
  );
}

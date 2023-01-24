import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilem_app/res/color.dart';

class AppTheme {
  static TextStyle mainTextStyle = GoogleFonts.poppins(
    color: AppColors.whiteColor,
  );

  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w800;
  static FontWeight black = FontWeight.w900;
}

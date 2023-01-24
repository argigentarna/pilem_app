import 'package:flutter/material.dart';
import 'package:pilem_app/res/theme.dart';

import 'color.dart';

class AppStyle {
  static TextStyle tRegular = AppTheme.mainTextStyle.copyWith(
    fontSize: 14,
    fontWeight: AppTheme.regular,
    color: AppColors.whiteColor,
  );

  static TextStyle tAppbar = AppTheme.mainTextStyle.copyWith(
    fontSize: 15,
    fontWeight: AppTheme.bold,
    color: AppColors.whiteColor,
  );

  static TextStyle tWelcomeSpeech = AppTheme.mainTextStyle.copyWith(
    fontSize: 25,
    fontWeight: AppTheme.bold,
    color: AppColors.blackColor,
  );

  static TextStyle tStatusMovie = AppTheme.mainTextStyle.copyWith(
    fontSize: 15,
    fontWeight: AppTheme.bold,
    color: AppColors.whiteColor,
  );

  static TextStyle tTitleMovie = AppTheme.mainTextStyle.copyWith(
    fontSize: 20,
    fontWeight: AppTheme.bold,
    color: AppColors.whiteColor,
  );

  static TextStyle tComment = AppTheme.mainTextStyle.copyWith(
    fontSize: 12,
    fontWeight: AppTheme.light,
    color: AppColors.whiteColor.withOpacity(
      0.5,
    ),
  );

  static TextStyle tCommentDate = AppTheme.mainTextStyle.copyWith(
    fontSize: 9,
    fontWeight: AppTheme.semiBold,
    color: AppColors.whiteColor.withOpacity(0.5),
  );
}

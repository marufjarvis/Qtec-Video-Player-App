import 'package:flutter/material.dart';
import 'package:qtec_video_player_app/contstant/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qtec_video_player_app/contstant/extention.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: AppColor.whiteColor,
      primaryColor: AppColor.titleColor,
      appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0.0),
      buttonTheme: ButtonThemeData(
          buttonColor: AppColor.blueColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r))),

      //text-theme
      textTheme: TextTheme(
          titleLarge: const TextStyle().titleLarge,
          titleMedium: const TextStyle().titleMid,
          titleSmall: const TextStyle().titleSmall,
          bodyLarge: const TextStyle().bodyLarge,
          bodyMedium: const TextStyle().bodyMid,
          bodySmall: const TextStyle().bodySmall));
}

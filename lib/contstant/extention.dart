import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qtec_video_player_app/contstant/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension TitleLarge on TextStyle {
  TextStyle get titleLarge => GoogleFonts.poppins(
      color: AppColor.titleColor, fontWeight: FontWeight.w700, fontSize: 20.sp);
}

extension TitleMid on TextStyle {
  TextStyle get titleMid => GoogleFonts.poppins(
      color: AppColor.titleColor, fontWeight: FontWeight.w600, fontSize: 17.sp);
}

extension TitleSmall on TextStyle {
  TextStyle get titleSmall => GoogleFonts.poppins(
      color: AppColor.greyColor, fontWeight: FontWeight.w400, fontSize: 15.sp);
}

extension BodyLarge on TextStyle {
  TextStyle get bodyLarge => GoogleFonts.poppins(
      color: AppColor.titleColor, fontWeight: FontWeight.w700, fontSize: 20.sp);
}

extension BodyMid on TextStyle {
  TextStyle get bodyMid => GoogleFonts.poppins(
        color: AppColor.titleColor,
        fontWeight: FontWeight.w600,
        fontSize: 15.sp,
      );
}

extension BodySmall on TextStyle {
  TextStyle get bodySmall => GoogleFonts.poppins(
      color: AppColor.greyColor, fontWeight: FontWeight.w400, fontSize: 13.sp);
}

extension BodySmallInter on TextStyle {
  TextStyle get bodySmallInter => GoogleFonts.inter(
      color: AppColor.greyColor, fontWeight: FontWeight.w400, fontSize: 10.sp);
}

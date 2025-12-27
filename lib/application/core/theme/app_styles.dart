import 'package:alison_test/application/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  static const String _fontFamily = 'Lufga';

  static TextStyle text(double size, FontWeight weight) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: size.sp,
      fontWeight: weight,
      color: AppColors.textDarkColor,
    );
  }

  static TextStyle text8f200 = text(8, FontWeight.w200);
  static TextStyle text8f300 = text(8, FontWeight.w300);
  static TextStyle text8f400 = text(8, FontWeight.w400);
  static TextStyle text8f500 = text(8, FontWeight.w500);
  static TextStyle text8f600 = text(8, FontWeight.w600);
  static TextStyle text8f700 = text(8, FontWeight.w700);

  static TextStyle text10f200 = text(10, FontWeight.w200);
  static TextStyle text10f300 = text(10, FontWeight.w300);
  static TextStyle text10f400 = text(10, FontWeight.w400);
  static TextStyle text10f500 = text(10, FontWeight.w500);
  static TextStyle text10f600 = text(10, FontWeight.w600);
  static TextStyle text10f700 = text(10, FontWeight.w700);

  static TextStyle text11f200 = text(11, FontWeight.w200);
  static TextStyle text11f300 = text(11, FontWeight.w300);
  static TextStyle text11f400 = text(11, FontWeight.w400);
  static TextStyle text11f500 = text(11, FontWeight.w500);
  static TextStyle text11f600 = text(11, FontWeight.w600);
  static TextStyle text11f700 = text(11, FontWeight.w700);

  static TextStyle text12f200 = text(12, FontWeight.w200);
  static TextStyle text12f300 = text(12, FontWeight.w300);
  static TextStyle text12f400 = text(12, FontWeight.w400);
  static TextStyle text12f500 = text(12, FontWeight.w500);
  static TextStyle text12f600 = text(12, FontWeight.w600);
  static TextStyle text12f700 = text(12, FontWeight.w700);

  static TextStyle text13f200 = text(13, FontWeight.w200);
  static TextStyle text13f300 = text(13, FontWeight.w300);
  static TextStyle text13f400 = text(13, FontWeight.w400);
  static TextStyle text13f500 = text(13, FontWeight.w500);
  static TextStyle text13f600 = text(13, FontWeight.w600);
  static TextStyle text13f700 = text(13, FontWeight.w700);

  static TextStyle text14f200 = text(14, FontWeight.w200);
  static TextStyle text14f300 = text(14, FontWeight.w300);
  static TextStyle text14f400 = text(14, FontWeight.w400);
  static TextStyle text14f500 = text(14, FontWeight.w500);
  static TextStyle text14f600 = text(14, FontWeight.w600);
  static TextStyle text14f700 = text(14, FontWeight.w700);

  static TextStyle text15f200 = text(15, FontWeight.w200);
  static TextStyle text15f300 = text(15, FontWeight.w300);
  static TextStyle text15f400 = text(15, FontWeight.w400);
  static TextStyle text15f500 = text(15, FontWeight.w500);
  static TextStyle text15f600 = text(15, FontWeight.w600);
  static TextStyle text15f700 = text(15, FontWeight.w700);

  static TextStyle text16f200 = text(16, FontWeight.w200);
  static TextStyle text16f300 = text(16, FontWeight.w300);
  static TextStyle text16f400 = text(16, FontWeight.w400);
  static TextStyle text16f500 = text(16, FontWeight.w500);
  static TextStyle text16f600 = text(16, FontWeight.w600);
  static TextStyle text16f700 = text(16, FontWeight.w700);

  static TextStyle text18f200 = text(18, FontWeight.w200);
  static TextStyle text18f300 = text(18, FontWeight.w300);
  static TextStyle text18f400 = text(18, FontWeight.w400);
  static TextStyle text18f500 = text(18, FontWeight.w500);
  static TextStyle text18f600 = text(18, FontWeight.w600);
  static TextStyle text18f700 = text(18, FontWeight.w700);

  static TextStyle text20f200 = text(20, FontWeight.w200);
  static TextStyle text20f300 = text(20, FontWeight.w300);
  static TextStyle text20f400 = text(20, FontWeight.w400);
  static TextStyle text20f500 = text(20, FontWeight.w500);
  static TextStyle text20f600 = text(20, FontWeight.w600);
  static TextStyle text20f700 = text(20, FontWeight.w700);

  static TextStyle text22f200 = text(22, FontWeight.w200);
  static TextStyle text22f300 = text(22, FontWeight.w300);
  static TextStyle text22f400 = text(22, FontWeight.w400);
  static TextStyle text22f500 = text(22, FontWeight.w500);
  static TextStyle text22f600 = text(22, FontWeight.w600);
  static TextStyle text22f700 = text(22, FontWeight.w700);

  static TextStyle text23f200 = text(23, FontWeight.w200);
  static TextStyle text23f300 = text(23, FontWeight.w300);
  static TextStyle text23f400 = text(23, FontWeight.w400);
  static TextStyle text23f500 = text(23, FontWeight.w500);
  static TextStyle text23f600 = text(23, FontWeight.w600);
  static TextStyle text23f700 = text(23, FontWeight.w700);

  static TextStyle text24f200 = text(24, FontWeight.w200);
  static TextStyle text24f300 = text(24, FontWeight.w300);
  static TextStyle text24f400 = text(24, FontWeight.w400);
  static TextStyle text24f500 = text(24, FontWeight.w500);
  static TextStyle text24f600 = text(24, FontWeight.w600);
  static TextStyle text24f700 = text(24, FontWeight.w700);

  static TextStyle text30f600 = text(30, FontWeight.w600);
}

class TextInputDecoration {
  static var decoration = InputDecoration(
    constraints: BoxConstraints(maxHeight: 60.h),
  );

  static InputBorder outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    // borderSide: BorderSide(color: ColorResources.borderColor)
  );

  static InputBorder disabled = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: BorderSide.none,
  );

  static InputBorder enabled = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: BorderSide.none,
  );

  static InputBorder focused = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: BorderSide.none,
  );
}

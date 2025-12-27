import 'package:alison_test/application/core/theme/app_colors.dart';
import 'package:alison_test/application/core/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.loading,
    this.color,
    this.width,
    this.height,
    this.leading,
  });
  final String title;
  final VoidCallback onPressed;
  final bool? loading;
  final Color? color;
  final double? width;
  final double? height;
  final String? leading;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 60.h,
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        child: Center(
          child: loading == true
              ? SizedBox(height: 50.h, child: CustomLoader().spinkit)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: AppStyle.text14f500.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class CustomLoader {
  final spinkit = SpinKitFadingCircle(color: Colors.white, size: 40.0);
}

class CustomLoadingWidget extends StatelessWidget {
  final Color? color;
  const CustomLoadingWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(color: color ?? Colors.white, size: 40.0);
  }
}

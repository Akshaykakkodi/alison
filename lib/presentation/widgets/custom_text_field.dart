import 'package:alison_test/application/core/theme/app_colors.dart';
import 'package:alison_test/application/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final int? maxLength;
  final void Function(String)? onChanged;

  final List<TextInputFormatter>? inputFormatters;

  final AutovalidateMode? autovalidateMode;
  final bool enabledBorder;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    required this.hintText,
    this.controller,
    this.maxLines,
    this.enabled,
    this.minLines,
    this.inputFormatters,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.autovalidateMode,
    this.enabledBorder = true,
    this.validator,
    this.maxLength,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //   height: 60.h,
      child: TextFormField(
        enabled: enabled,
        onChanged: onChanged,
        style: AppStyle.text15f500,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        minLines: minLines,
        maxLines: maxLines,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          counterText: "",
          isDense: false,
          hintText: hintText,
          hintStyle: AppStyle.text14f400.copyWith(color: AppColors.grey3),
          filled: true,
          fillColor: Colors.white, // White background
          // prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14), // Curved outline
            borderSide: BorderSide(
              color: enabledBorder
                  ? AppColors.grey2
                  : AppColors.scaffoldBackground,
              width: 1,
            ), // // Grey border
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14), // Curved outline
            borderSide: BorderSide(
              color: enabledBorder
                  ? AppColors.grey2
                  : AppColors.scaffoldBackground,
              width: 1,
            ), // // Grey border
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: enabledBorder
                  ? AppColors.grey2
                  : AppColors.scaffoldBackground,
              width: 1,
            ), // Change color when focused
          ),
          errorStyle: AppStyle.text12f500.copyWith(color: Colors.red),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: enabledBorder
                  ? AppColors.grey2
                  : AppColors.scaffoldBackground,
              width: 1,
            ), // Change color when focused
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: enabledBorder
                  ? AppColors.grey2
                  : AppColors.scaffoldBackground,
              width: 1,
            ), // Change color when focused
          ),

          contentPadding: EdgeInsets.symmetric(
            vertical: 16.h,
            horizontal: 18.w,
          ),

          // Padding inside field
          // prefixIconConstraints: BoxConstraints(
          //   minWidth: 30.w,
          //   minHeight: 30.h,
          // ),
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                  ), // Responsive padding using ScreenUtil
                  child: prefixIcon,
                )
              : null,

          prefixIconConstraints: BoxConstraints(
            minWidth: 20.w, // Adjust to keep icon size proportional
            minHeight: 60.h,
          ),
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: EdgeInsets.only(
                    right: 16.w,
                  ), // Responsive padding using ScreenUtil
                  child: suffixIcon,
                )
              : null,
          suffixIconConstraints: BoxConstraints(
            minWidth: 20.w, // Adjust to keep icon size proportional
            minHeight: 60.h,
          ),
        ),
      ),
    );
  }
}

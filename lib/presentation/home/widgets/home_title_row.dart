import 'package:alison_test/application/core/theme/app_colors.dart';
import 'package:alison_test/application/core/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeTitleRow extends StatelessWidget {
  final String name;
  const HomeTitleRow({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),

      child: Row(
        children: [
          Text(
            name,
            style: AppStyle.text16f500.copyWith(color: AppColors.primaryColor),
          ),
          Spacer(),
          Icon(Icons.arrow_back_ios, size: 15),
          Gap(10.w),
          Icon(Icons.arrow_forward_ios, size: 15),
        ],
      ),
    );
  }
}

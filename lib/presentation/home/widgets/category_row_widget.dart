import 'package:alison_test/application/core/theme/app_styles.dart';
import 'package:alison_test/application/utils/app_assets.dart';
import 'package:alison_test/presentation/home/widgets/home_title_row.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CategoryRowWidget extends StatelessWidget {
  const CategoryRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeTitleRow(name: "Category"),
        Gap(15.h),
        SizedBox(
          height: 150.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 15.w : 0),
                child: CategoryItem(),
              );
            },
            separatorBuilder: (context, index) => Gap(15.w),
            itemCount: 8,
          ),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.w,
      child: Column(
        children: [
          Container(
            height: 70.h,
            width: 70.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              color: Colors.amber,
            ),
            child: Image.asset(AppAssets.category),
          ),
          Gap(10.h),

          Text(
            "Unpolished Rice",
            style: AppStyle.text11f500.copyWith(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

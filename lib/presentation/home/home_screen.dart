import 'package:alison_test/application/core/theme/app_colors.dart';
import 'package:alison_test/application/utils/app_assets.dart';
import 'package:alison_test/presentation/home/widgets/carousel_banner_widget.dart';
import 'package:alison_test/presentation/home/widgets/category_row_widget.dart';
import 'package:alison_test/presentation/home/widgets/custom_bottom_nav.dart';
import 'package:alison_test/presentation/home/widgets/product_roe_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        title: Image.asset(AppAssets.logo1Png, scale: 2),
        actions: [
          SvgPicture.asset(AppAssets.searchIcon),
          Gap(10.w),
          SvgPicture.asset(AppAssets.wishlist),
          Gap(10.w),

          SvgPicture.asset(AppAssets.notificationIcon),
          Gap(10.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(15.w),
            BannerCarousel(),
            Gap(20.h),
            CategoryRowWidget(),
            ProductsRowTile(name: "Featured Products"),
            Gap(20.h),
            ProductsRowTile(name: "Daily Best Selling"),
            Gap(20.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 170.h,
                width: 340.w,

                child: Image.asset(AppAssets.banner),
              ),
            ),
            Gap(20.h),
            ProductsRowTile(name: "Recently Added"),
            Gap(150),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(currentIndex: 0, onTap: (index) {}),
    );
  }
}

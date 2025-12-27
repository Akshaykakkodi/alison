import 'package:alison_test/application/utils/app_assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/banner1.png',
      'assets/images/banner2.png',
      'assets/images/banner3.png',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: images.map((image) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 170.h,
            width: 340.w,

            child: Image.asset(AppAssets.banner),
          ),
        );
      }).toList(),
    );
  }
}

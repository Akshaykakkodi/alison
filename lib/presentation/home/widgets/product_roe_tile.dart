import 'package:alison_test/presentation/home/widgets/home_title_row.dart';
import 'package:alison_test/presentation/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductsRowTile extends StatelessWidget {
  final String name;

  const ProductsRowTile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          HomeTitleRow(name: name),
          Gap(20.h),
          Container(
            child: SizedBox(
              height: 235.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ProductCard(
                  imageUrl:
                      "https://cdn.pixabay.com/photo/2023/12/16/19/33/christmas-8453173_1280.jpg",
                  category: "Fancy",
                  currentPrice: 122,
                  originalPrice: 12,
                  productName: "Mask",
                  onAddToCart: () {},
                  onFavoriteToggle: () {},
                ),
                separatorBuilder: (context, index) => Gap(10),
                itemCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

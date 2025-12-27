import 'package:alison_test/application/core/theme/app_colors.dart';
import 'package:alison_test/application/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductCard extends StatefulWidget {
  final String imageUrl;
  final String category;
  final String productName;
  final double currentPrice;
  final double originalPrice;
  final VoidCallback? onAddToCart;
  final VoidCallback? onFavoriteToggle;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.category,
    required this.productName,
    required this.currentPrice,
    required this.originalPrice,
    this.onAddToCart,
    this.onFavoriteToggle,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      height: 229.h,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image section with favorite button
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16),
                child: Container(
                  height: 100.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.network(
                    widget.imageUrl,
                    // height: 160,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image,
                        size: 80,
                        color: Colors.grey,
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                    widget.onFavoriteToggle?.call();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: const Color(0xFF8B4513),
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Product details section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category
              Gap(10.h),
              Text(
                widget.category,
                style: AppStyle.text10f400.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 5.h),

              // Product name
              Text(widget.productName, style: AppStyle.text12f500),
              SizedBox(height: 5.h),

              // Price section
              Row(
                children: [
                  Text(
                    '₹ ${widget.currentPrice.toStringAsFixed(2)}',
                    style: AppStyle.text10f400.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    '₹ ${widget.originalPrice.toStringAsFixed(2)}',
                    style: AppStyle.text10f500.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),

              // Add to cart button
              SizedBox(
                width: double.infinity,
                height: 34.h,
                child: ElevatedButton(
                  onPressed: widget.onAddToCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF8B4513),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: Colors.white,
                        // width: 1.5,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add',
                        style: AppStyle.text12f500.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.shopping_cart_outlined, size: 22),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

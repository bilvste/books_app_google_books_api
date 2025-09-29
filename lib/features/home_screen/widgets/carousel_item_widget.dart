import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselItemWidget extends StatelessWidget {
  const CarouselItemWidget({
    super.key,
    required this.imageUrl,
    required this.price,
    this.onTap,
  });

  final String imageUrl;
  final String price;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150.w,
        height: 225.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              // Glassmorphism price container
              Positioned(
                bottom: 8.h,
                right: 8.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.r),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      color: Colors.white.withValues(alpha: 0.2),
                      child: Text(
                        price,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

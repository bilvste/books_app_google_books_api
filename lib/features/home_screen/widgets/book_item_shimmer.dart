import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BookItemShimmer extends StatelessWidget {
  const BookItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: SizedBox(
          width: 300.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // صورة الكتاب
              Container(
                width: 90.w,
                height: 120.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              SizedBox(width: 30.w),
              // النصوص
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // عنوان الكتاب
                    Container(height: 20.h, width: 150.w, color: Colors.white),
                    SizedBox(height: 8.h),
                    // المؤلف
                    Container(height: 16.h, width: 100.w, color: Colors.white),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        // السعر/التصنيف
                        Expanded(
                          child: Container(
                            height: 20.h,
                            width: 80.w,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        // النجمة + الريفيوز
                        Container(
                          height: 16.h,
                          width: 40.w,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          height: 14.h,
                          width: 30.w,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

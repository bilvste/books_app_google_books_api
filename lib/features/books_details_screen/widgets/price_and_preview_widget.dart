import 'package:books_app/core/routing/app_routes.dart';
import 'package:books_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PriceAndPreviewWidget extends StatelessWidget {
  final String previewLink;
  final String price;
  const PriceAndPreviewWidget({
    super.key,
    required this.previewLink,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
              ),
            ),
            child: Text(price, style: AppStyles.black16w600(context)),
          ),
          InkWell(
            onTap: () {
              if (previewLink.isNotEmpty) {
                context.push(AppRoutes.previewPageScreen, extra: previewLink);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Preview link is empty")),
                );
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 16.h),

              decoration: BoxDecoration(
                color: Color(0xffEF8262),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
              ),
              child: Text("Preview", style: AppStyles.black16w600(context)),
            ),
          ),
        ],
      ),
    );
  }
}

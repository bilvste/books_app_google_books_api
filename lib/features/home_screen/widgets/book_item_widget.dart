import 'package:books_app/core/styling/app_styles.dart';
import 'package:books_app/core/widgets/spacing_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItemWidget extends StatelessWidget {
  final String imageUrl;
  final String bookName;
  final String authorName;
  final String averageRating;
  final String ratingsCount;
  final String price;
  final void Function()? onTap;
  const BookItemWidget({
    super.key,
    required this.imageUrl,
    required this.bookName,
    required this.authorName,
    required this.averageRating,
    required this.ratingsCount,
    required this.onTap,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h, right: 20.w),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            WidthSpace(30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.primaryHeadLine(context),
                  ),
                  HeightSpace(4),
                  Text(authorName, style: AppStyles.subtitleHeadLine(context)),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "$price",
                          style: AppStyles.black22w600(context),
                        ),
                      ),

                      Icon(Icons.star, color: Colors.yellow, size: 18.sp),
                      SizedBox(width: 4.w),
                      Text(
                        averageRating,
                        style: AppStyles.black16w600(
                          context,
                        ).copyWith(color: Colors.grey[500]),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        '($ratingsCount)',
                        style: AppStyles.grey14w500(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

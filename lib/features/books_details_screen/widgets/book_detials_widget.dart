import 'package:books_app/core/styling/app_styles.dart';
import 'package:books_app/core/widgets/spacing_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetialsWidget extends StatelessWidget {
  final String? imageUrl;
  final String? bookName;
  final String? authorName;
  final String? averageRating;
  final String? ratingsCount;
  const BookDetialsWidget({
    super.key,
    required this.imageUrl,
    required this.bookName,
    required this.authorName,
    required this.averageRating,
    required this.ratingsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:
                  imageUrl ??
                  "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQlMPUYcyU4Qbv-ulofYB0K9GL_eHH0nFOwkXOeGR9flxTA8VRj",
              width: 160.w,
              height: 240.h,
            ),
          ),
          HeightSpace(16),
          Text(
            textAlign: TextAlign.center,
            bookName ?? "Book Name",
            style: AppStyles.primaryHeadLine(context),
          ),
          Text(
            authorName ?? "Author Name",
            style: AppStyles.subtitleHeadLine(context),
          ),
          HeightSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.yellow, size: 18.sp),
              SizedBox(width: 4.w),
              Text(
                averageRating ?? '4.5',
                style: AppStyles.black16w600(
                  context,
                ).copyWith(color: Colors.grey[500]),
              ),
              SizedBox(width: 6.w),
              Text('($ratingsCount)', style: AppStyles.grey14w500(context)),
            ],
          ),
        ],
      ),
    );
  }
}

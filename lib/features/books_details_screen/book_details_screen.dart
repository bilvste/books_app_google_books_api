import 'package:books_app/core/styling/app_styles.dart';
import 'package:books_app/core/widgets/spacing_widget.dart';
import 'package:books_app/features/books_details_screen/widgets/book_detials_widget.dart';
import 'package:books_app/features/books_details_screen/widgets/price_and_preview_widget.dart';
import 'package:books_app/features/home_screen/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsScreen extends StatefulWidget {
  final Item bookItem;
  final String? description;

  const BookDetailsScreen({
    super.key,
    this.description,
    required this.bookItem,
  });

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.shopping_cart_outlined,
            color: Theme.of(context).colorScheme.onSurface,
            size: 24.sp,
          ),

          WidthSpace(16.w),
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                BookDetialsWidget(
                  imageUrl:
                      widget.bookItem.volumeInfo?.imageLinks?.thumbnail ??
                      "https://www.nomadfoods.com/wp-content/uploads/2018/08/placeholder-1-e1533569576673-960x960.png", // صورة افتراضية
                  bookName: widget.bookItem.volumeInfo?.title ?? "No Title",
                  authorName:
                      (widget.bookItem.volumeInfo?.authors?.isNotEmpty ?? false)
                      ? widget.bookItem.volumeInfo!.authors!.first
                      : "Unknown Author",
                  averageRating:
                      widget.bookItem.volumeInfo?.averageRating?.toString() ??
                      "0",
                  ratingsCount:
                      widget.bookItem.volumeInfo?.ratingsCount?.toString() ??
                      "0",
                ),

                HeightSpace(30),
                PriceAndPreviewWidget(
                  previewLink: widget.bookItem.volumeInfo?.previewLink ?? "",
                  price: widget.bookItem.saleInfo?.listPrice?.amount != null
                      ? "${widget.bookItem.saleInfo!.listPrice!.amount} EGP"
                      : "Free Ebook",
                ),
                HeightSpace(20),

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    textAlign: TextAlign.start,
                    widget.bookItem.volumeInfo?.description ?? "No Description",
                    style: AppStyles.black16w400(context),
                  ),
                ),
                HeightSpace(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:books_app/core/routing/app_routes.dart';
import 'package:books_app/features/home_screen/cubit/book_carousel_cubit.dart';
import 'package:books_app/features/home_screen/cubit/book_carousel_state.dart';
import 'package:books_app/features/home_screen/model/book_model.dart';
import 'package:books_app/features/home_screen/widgets/book_carousel_item_shimmer.dart';
import 'package:books_app/features/home_screen/widgets/carousel_item_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

class CarouselCubitList extends StatefulWidget {
  const CarouselCubitList({super.key});

  @override
  State<CarouselCubitList> createState() => _CarouselCubitListState();
}

class _CarouselCubitListState extends State<CarouselCubitList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCarouselCubit, BookCarouselState>(
      builder: (BuildContext context, BookCarouselState state) {
        if (state is BookCarouselLoading) {
          return SizedBox(
            height: 225.h,
            child: AnimationLimiter(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (_, __) => SizedBox(width: 12.w),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(seconds: 1),
                    child: SlideAnimation(
                      horizontalOffset: 200,
                      child: FadeInAnimation(child: CarouselItemShimmer()),
                    ),
                  );
                },
              ),
            ),
          );
        }

        if (state is BookCarouselLoaded) {
          BookModel bookModel = state.booksCarousel;
          return CarouselSlider.builder(
            itemBuilder: (context, index, realIndex) {
              return CarouselItemWidget(
                onTap: () {
                  context.pushNamed(
                    AppRoutes.bookDetailsScreen,
                    extra: bookModel.items![index],
                  );
                },
                imageUrl:
                    bookModel.items![index].volumeInfo!.imageLinks!.thumbnail!,
                price:
                    bookModel.items![index].saleInfo?.listPrice?.amount != null
                    ? "${bookModel.items![index].saleInfo!.listPrice!.amount} EGP"
                    : "Free Ebook",
              );
            },
            itemCount: bookModel.items!.length,
            options: CarouselOptions(
              scrollPhysics: BouncingScrollPhysics(),
              viewportFraction: 0.46,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              enlargeFactor: 0.18,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              scrollDirection: Axis.horizontal,
              padEnds: false, // مهم عشان مايسيبش فراغ في الآخر
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

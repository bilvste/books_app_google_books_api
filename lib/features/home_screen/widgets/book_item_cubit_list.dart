import 'package:books_app/core/routing/app_routes.dart';
import 'package:books_app/features/home_screen/cubit/book_best_seller_cubit.dart';
import 'package:books_app/features/home_screen/cubit/book_best_seller_state.dart';
import 'package:books_app/features/home_screen/model/book_model.dart';
import 'package:books_app/features/home_screen/widgets/book_item_shimmer.dart';
import 'package:books_app/features/home_screen/widgets/book_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class BookItemCubitList extends StatefulWidget {
  const BookItemCubitList({super.key});

  @override
  State<BookItemCubitList> createState() => _BookItemCubitListState();
}

class _BookItemCubitListState extends State<BookItemCubitList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBestSellerCubit, BookState>(
      builder: (context, state) {
        if (state is BookLoading) {
          return AnimationLimiter(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(seconds: 1),
                  child: SlideAnimation(
                    verticalOffset: 200,
                    child: FadeInAnimation(child: BookItemShimmer()),
                  ),
                );
              },
            ),
          );
        }
        if (state is BookLoaded) {
          BookModel bookModel = state.booksList;
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return BookItemWidget(
                onTap: () {
                  context.pushNamed(
                    AppRoutes.bookDetailsScreen,
                    extra: bookModel.items![index],
                  );
                },
                imageUrl:
                    bookModel.items![index].volumeInfo?.imageLinks?.thumbnail ??
                    "",
                bookName:
                    bookModel.items![index].volumeInfo?.title ?? "No Title",
                authorName:
                    (bookModel.items![index].volumeInfo?.authors?.isNotEmpty ??
                        false)
                    ? bookModel.items![index].volumeInfo!.authors!.first
                    : "Unknown Author",
                averageRating:
                    (bookModel.items![index].volumeInfo?.averageRating ?? 0)
                        .toString(),
                ratingsCount:
                    (bookModel.items![index].volumeInfo?.ratingsCount ?? 0)
                        .toString(),
                price:
                    bookModel.items![index].saleInfo?.listPrice?.amount != null
                    ? "${bookModel.items![index].saleInfo!.listPrice!.amount} EGP"
                    : "Free Ebook",
              );
            },
            itemCount: bookModel.items!.length,
          );
        }
        return Container();
      },
    );
  }
}

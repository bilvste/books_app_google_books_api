import 'package:books_app/core/cubit/theme_cubit.dart';
import 'package:books_app/core/routing/app_routes.dart';
import 'package:books_app/core/styling/app_assets.dart';
import 'package:books_app/core/widgets/spacing_widget.dart';
import 'package:books_app/features/home_screen/cubit/book_best_seller_cubit.dart';
import 'package:books_app/features/home_screen/cubit/book_carousel_cubit.dart';
import 'package:books_app/features/home_screen/widgets/book_item_cubit_list.dart';
import 'package:books_app/features/home_screen/widgets/carousel_cubit_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<BookBestSellerCubit>().fetchBooks();
    context.read<BookCarouselCubit>().fetchCarouselBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                context.read<ThemeCubit>().changeTheme();
              },
              icon: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                color: Theme.of(context).colorScheme.onSurface,
                size: 24.sp,
              ),
            ),
            SvgPicture.asset(
              AppAssets.logoSVG,
              height: 24.sp,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.onSurface,
                BlendMode.srcIn,
              ),
            ),
            InkWell(
              onTap: () {
                context.push(AppRoutes.searchScreen);
              },
              child: SvgPicture.asset(
                AppAssets.searchSVGIcon,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
                height: 24.h,
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 16.w),
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              context.read<BookBestSellerCubit>().fetchBooks(),
              context.read<BookCarouselCubit>().fetchCarouselBooks(),
            ]);
          },

          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeightSpace(40),
                CarouselCubitList(),
                SizedBox(height: 16.h),
                Text(
                  "Best Sellers",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                // هنا بدل ما نجيب الـ List عادي
                // هنستخدم BlocBuilder جوه BookItemCubitList
                BookItemCubitList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

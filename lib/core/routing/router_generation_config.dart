import 'package:books_app/core/routing/app_routes.dart';
import 'package:books_app/core/utils/service_locator.dart';
import 'package:books_app/features/books_details_screen/book_details_screen.dart';
import 'package:books_app/features/home_screen/cubit/book_best_seller_cubit.dart';
import 'package:books_app/features/home_screen/cubit/book_carousel_cubit.dart';
import 'package:books_app/features/home_screen/home_screen.dart';
import 'package:books_app/features/home_screen/model/book_model.dart';
import 'package:books_app/features/search_screen/cubit/search_cubit.dart';
import 'package:books_app/features/search_screen/search_screen.dart';
import 'package:books_app/features/web_view_screen/preview_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.homeScreen,
    routes: [
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => sl<BookBestSellerCubit>()),
              BlocProvider(create: (context) => sl<BookCarouselCubit>()),
            ],
            child: const HomeScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.bookDetailsScreen,
        name: AppRoutes.bookDetailsScreen,
        builder: (context, state) {
          final bookItem = state.extra as Item; // ✅ خليها Item
          return BlocProvider(
            create: (context) => sl<BookBestSellerCubit>(),
            child: BookDetailsScreen(bookItem: bookItem),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.previewPageScreen,
        name: AppRoutes.previewPageScreen,
        builder: (context, state) {
          final previewLink = state.extra as String; // ✅ خليها String
          return PreviewPage(url: previewLink);
        },
      ),
      GoRoute(
        path: AppRoutes.searchScreen,
        name: AppRoutes.searchScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<SearchCubit>(),
            child: const SearchScreen(),
          );
        },
      ),
    ],
  );
}

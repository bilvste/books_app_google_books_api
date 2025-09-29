import 'package:books_app/core/cubit/theme_cubit.dart';
import 'package:books_app/core/networking/dio_helper.dart';
import 'package:books_app/features/home_screen/cubit/book_best_seller_cubit.dart';
import 'package:books_app/features/home_screen/cubit/book_carousel_cubit.dart';
import 'package:books_app/features/home_screen/repos/book_repo.dart';
import 'package:books_app/features/search_screen/cubit/search_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  DioHelper dio = DioHelper();

  // Dio Helper
  sl.registerSingleton<DioHelper>(dio);

  // Repos
  // sl.registerLazySingleton(() => AuthRepo(sl<DioHelper>()));
  sl.registerLazySingleton(() => BookRepo(sl<DioHelper>()));
  // sl.registerLazySingleton(() => CartRepo(sl<DioHelper>()));

  // Cubit
  sl.registerFactory(() => BookBestSellerCubit(sl<BookRepo>()));
  sl.registerFactory(() => BookCarouselCubit(sl<BookRepo>()));
  sl.registerFactory(() => SearchCubit(sl<BookRepo>()));
  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  // sl.registerFactory(() => CategoriesCubit(sl<HomeRepo>()));
  // sl.registerFactory(() => ProductCubit(sl<HomeRepo>()));
  // sl.registerFactory(() => CartCubit(sl<CartRepo>()));

  // // Storage Helper
  // sl.registerLazySingleton(() => StorageHelper());
}

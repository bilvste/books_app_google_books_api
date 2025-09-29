import 'package:books_app/core/cubit/theme_cubit.dart';
import 'package:books_app/core/routing/router_generation_config.dart';
import 'package:books_app/core/styling/theme_data.dart';
import 'package:books_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  final themeCubit = sl<ThemeCubit>(); // هنا عرف النوع
  await themeCubit.loadTheme();

  runApp(BlocProvider.value(value: themeCubit, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDark) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return MaterialApp.router(
              title: 'Flutter Demo',
              theme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
              routerConfig: RouterGenerationConfig.goRouter,
            );
          },
        );
      },
    );
  }
}

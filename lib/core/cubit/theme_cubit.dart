import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false;
    emit(isDark);
  }

  Future<void> changeTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final newState = !state;
    await prefs.setBool('isDark', newState);
    emit(newState);
  }
}

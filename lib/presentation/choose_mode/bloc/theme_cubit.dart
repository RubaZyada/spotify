import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  // عند استدعاء المستخدم لتغيير الوضع
  void updatetheme(ThemeMode themeMode) => emit(themeMode);

  // تحويل الحالة إلى JSON وتخزينها
  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'theme': state.toString().split('.').last};
  }

  // استرجاع الحالة عند فتح التطبيق مجددًا
  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final themeString = json['theme'] as String?;
    switch (themeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}

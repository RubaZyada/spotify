import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);
  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    
    throw UnimplementedError();
  }

}
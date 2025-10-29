import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/theme/app_themes.dart';

class ChangeModeCubit extends Cubit<ThemeData> {
  ChangeModeCubit() : super(AppTheme.getLightTheme());

  void changeMode({required ThemeData theme}) {
    emit(theme);
  }
}

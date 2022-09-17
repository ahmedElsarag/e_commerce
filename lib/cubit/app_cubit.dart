import 'package:bloc/bloc.dart';
import 'package:e_commerce/commen_utils/preference/Prefs.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  bool isLightMode = true;

  void changeAppThemeMode(){
    isLightMode = !isLightMode;
    emit(ChangeThemeModeState());
  }

  Future<bool> isFirstTime() async{
    return await Prefs.isFirstTime;
  }
}

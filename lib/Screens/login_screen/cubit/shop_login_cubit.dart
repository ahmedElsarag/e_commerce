import 'package:bloc/bloc.dart';
import 'package:e_commerce/Screens/login_screen/cubit/shop_login_state.dart';
import 'package:e_commerce/network/end_points.dart';
import 'package:e_commerce/shared/components/CustomToast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../commen_utils/preference/Prefs.dart';
import '../../../network/api/dio_helper.dart';
import '../../../network/models/LoginResponse.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  LoginResponse? loginResponse;

  void loginApiCall({required String email, required String password}) {
    emit(ShopLoginLoadingState());
    print(email);
    print(password);
    DioHelper.postData<LoginResponse>(
      url: EndPoints.login,
      data: {'email': email, 'password': password},
      onSuccess: (response) {
        if(response?.status??false){
          if (kDebugMode) {
            print('${response.message!} ${response.status}');
          }
          Prefs.setIsLogin(true);
          Prefs.setUserToken(response!.data!.token!);
          emit(ShopLoginSuccessState());
          CustomToast.showToast(msg: response!.message!);
        }else{
          emit(ShopLoginErrorState(response?.message));
        }
        }

    ).catchError((error) {
      emit(ShopLoginErrorState(error.toString()));
    });
  }
}

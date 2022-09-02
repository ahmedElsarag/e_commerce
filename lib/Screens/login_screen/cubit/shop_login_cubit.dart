import 'package:bloc/bloc.dart';
import 'package:e_commerce/Screens/login_screen/cubit/shop_login_state.dart';
import 'package:e_commerce/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../network/api/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitState());

  static ShopLoginCubit get(context)=>BlocProvider.of(context);

  void loginApiCall({required String email, required String password}) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
      url: EndPoints.login,
      data: {'email': email, 'password': password},
    ).then((value) {
      print('### ${value?.data}');
      emit(ShopLoginSuccessState());
    }).catchError((error){
      emit(ShopLoginErrorState(error.toString()));
    });
  }
}

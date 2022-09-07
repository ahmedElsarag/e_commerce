import 'package:bloc/bloc.dart';
import 'package:e_commerce/Screens/login_screen/cubit/shop_login_state.dart';
import 'package:e_commerce/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        print(response.message! +' '+ response.status.toString());
        emit(ShopLoginSuccessState());
      },
    ).catchError((error) {
      emit(ShopLoginErrorState(error.toString()));
    });
  }
}

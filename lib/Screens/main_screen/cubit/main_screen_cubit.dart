import 'package:e_commerce/Screens/category_screen/category_screen.dart';
import 'package:e_commerce/Screens/favorit_screen/favorite_screen.dart';
import 'package:e_commerce/Screens/home_screen/home_screen.dart';
import 'package:e_commerce/Screens/main_screen/cubit/main_screen_states.dart';
import 'package:e_commerce/Screens/setting_screen/more_screen.dart';
import 'package:e_commerce/network/api/dio_helper.dart';
import 'package:e_commerce/network/end_points.dart';
import 'package:e_commerce/network/models/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenCubit extends Cubit<MainScreenStates> {
  MainScreenCubit() : super(MainScreenInitialState());

  static MainScreenCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoriteScreen(),
    const MoreScreen()
  ];

  int bottomNavIndex = 0;

  void changeBottomNavIndex(int index) {
    bottomNavIndex = index;
    emit(BottomNavIndexState());
  }

  HomeResponse? homeResponse;

  void getHomeData() {
    emit(LoadingHomeDataState());
    DioHelper.getData<HomeResponse>(
        url: EndPoints.home,
        onSuccess: (response) {
          emit(SuccessHomeDataState());
          if(response!.status!) {
            print(response.data?.products![0]?.name);
            homeResponse = response;
          }

        }).catchError((error){
          print(error);
          emit(ErrorHomeDataState());
    });
  }
}

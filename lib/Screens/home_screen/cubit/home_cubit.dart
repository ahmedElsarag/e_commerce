import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../network/api/dio_helper.dart';
import '../../../network/end_points.dart';
import '../../../network/models/home_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
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

  int _carouselIndex = 0;

  int get carouselIndex => _carouselIndex;

  set carouselIndex(int value) {
    _carouselIndex = value;
    emit(CarouselIndexState());
  }
}

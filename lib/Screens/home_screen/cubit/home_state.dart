part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class LoadingHomeDataState extends HomeState{}
class SuccessHomeDataState extends HomeState{}
class ErrorHomeDataState extends HomeState{}
class LoadingHomeCategoryState extends HomeState{}
class SuccessHomeCategoryState extends HomeState{}
class ErrorHomeCategoryState extends HomeState{}
class CarouselIndexState extends HomeState{}



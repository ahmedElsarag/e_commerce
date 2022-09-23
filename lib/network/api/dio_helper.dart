import 'package:dio/dio.dart';
import 'package:e_commerce/network/entity_factory.dart';
import 'package:e_commerce/network/models/LoginResponse.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: 50000,
        receiveTimeout: 5000,
        headers: {
          'Content-Type': 'application/json',
        }));
  }

  static Future<T?> getData<T>(
      {required String url, Map<String, dynamic>? query, required Function(T response) onSuccess}) async {
    return await dio?.get(url, queryParameters: query).then((value){
      print(value.statusCode);
      print(value.statusMessage);
      onSuccess(EntityFactory.generateOBJ<T>(value?.data) as T);
    });
  }

  static Future<T?> postData<T>(
      {required String url,
        required Function(T response) onSuccess,
        Map<String, dynamic>? query,
        required Map<String, dynamic> data}) async {

   return await dio?.post(url,queryParameters: query ,data: data).then((value){
     print(value.statusCode);
     print(value.statusMessage);
     onSuccess(EntityFactory.generateOBJ<T>(value?.data) as T);
   });
  }
}

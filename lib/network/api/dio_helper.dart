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

  static Future<Response?> getData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio?.get(url, queryParameters: query);
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

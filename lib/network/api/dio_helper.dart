import 'dart:math';

import 'package:dio/dio.dart';
import 'package:e_commerce/network/entity_factory.dart';
import 'package:logger/logger.dart';

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
    dio?.interceptors.add(LoggingInterceptor());
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

///Log interceptor settings
class LoggingInterceptor extends Interceptor {
  late DateTime startTime;
  late DateTime endTime;
  var logger = Logger(

  );

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    startTime = DateTime.now();
    Logger().d("----------Request Start---------");

    ///print full path request
    if (options.queryParameters.isEmpty) {
      if (options.path.contains(options.baseUrl)) {
        logger.i("RequestUrl:${options.path}");
      } else {
        logger.i("RequestUrl:${options.baseUrl}${options.path}");
      }
    } else {
      ///If queryParameters is not empty, splice into a complete URl
      logger.i("RequestUrl:${options.baseUrl}${options.path}?${Transformer.urlEncodeMap(options.queryParameters)}");
    }
    logger.d("RequestHeaders:${options.headers}");
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    endTime = DateTime.now();
    //Request duration
    int duration = endTime.difference(startTime).inMilliseconds;
    logger.d("----------End Request $duration millisecond---------");
    logger.d('${response.statusCode} ${response.statusMessage} ${response.data}');
//    logger.d(response.data);
    return super.onResponse(response, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) {
    logger.d("--------------Error-----------");
    return super.onError(err, handler);
  }
}

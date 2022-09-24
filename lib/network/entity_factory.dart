import 'package:e_commerce/network/models/home_model.dart';

import 'models/LoginResponse.dart';
import 'models/category_response.dart';
import 'models/surah_response.dart';

class EntityFactory {
  static T? generateOBJ<T>(json) {
    switch (T.toString()) {
      case "LoginResponse":
        return LoginResponse.fromJson(json) as T;
      case "HomeResponse":
        return HomeResponse.fromJson(json) as T;
      case "CategoryResponse":
        return CategoryResponse.fromJson(json) as T;

      default:
        return null;
    }
  }
}

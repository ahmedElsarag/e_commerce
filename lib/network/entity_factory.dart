import 'package:e_commerce/network/models/home_model.dart';

import 'models/LoginResponse.dart';

class EntityFactory {
  static T? generateOBJ<T>(json) {
    switch (T.toString()) {
      case "LoginResponse":
        return LoginResponse.fromJson(json) as T;
      case "HomeResponse":
        return HomeResponse.fromJson(json) as T;

      default:
        return null;
    }
  }
}
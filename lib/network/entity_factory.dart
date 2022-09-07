import 'models/LoginResponse.dart';

class EntityFactory {
  static T? generateOBJ<T>(json) {
    switch (T.toString()) {
      case "LoginResponse":
        return LoginResponse.fromJson(json) as T;
        break;

      default:
        return null;
    }
  }
}
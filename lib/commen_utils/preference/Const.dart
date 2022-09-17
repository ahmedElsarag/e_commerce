import 'package:flutter/cupertino.dart';

ValueNotifier<Locale> mobileLanguage = ValueNotifier(const Locale('en', ''));

class Const {

  static const String IS_LOGIN_KEY = "is_logged_in";

  static const String USER_TOKEN = "USER_TOKEN";

  static const String APP_LOCAL = "APP_LOCAL";

  static const String IS_FIRST_TIME_KEY = "FIRST_TIME";


}

enum FileType { products, posts, reviews, comments }

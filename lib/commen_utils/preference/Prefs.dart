import 'Const.dart';
import 'helper.dart';

class Prefs {
  static Future<bool>  containsKey(String key)  {
     return PreferencesHelper.containsKey(key);
  }
  static Future<bool> get isLogin =>
      PreferencesHelper.getBool(Const.IS_LOGIN_KEY);

  static Future setIsLogin(bool value) =>
      PreferencesHelper.setBool(Const.IS_LOGIN_KEY, value);

  static Future<String> get userToken =>
      PreferencesHelper.getString(Const.USER_TOKEN);

  static Future setUserToken(String value) =>
      PreferencesHelper.setString(Const.USER_TOKEN, value);


  static Future setAppLocal(String value) =>
      PreferencesHelper.setString(Const.APP_LOCAL, value);

  static Future<String> get getAppLocal =>
      PreferencesHelper.getString(Const.APP_LOCAL);

  static Future<bool> get isFirstTime => PreferencesHelper.getBool(Const.IS_FIRST_TIME_KEY);

  static Future setIsFirstTime(bool value) => PreferencesHelper.setBool(Const.IS_FIRST_TIME_KEY, value);


  static Future<void> clear() async {
    PreferencesHelper.clearPrefs();
  }

  static Future<void> clearExpectLanguage() async {
    getAppLocal.then((value) => {
          PreferencesHelper.clearPrefs(),
          setAppLocal(value),
        });
  }
}

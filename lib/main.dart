import 'package:e_commerce/Screens/home_screen/home_screen.dart';
import 'package:e_commerce/Screens/login_screen/login_screen.dart';
import 'package:e_commerce/commen_utils/preference/Const.dart';
import 'package:e_commerce/commen_utils/preference/Prefs.dart';
import 'package:e_commerce/cubit/app_cubit.dart';
import 'package:e_commerce/layout/HomeLayout.dart';
import 'package:e_commerce/network/api/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'Screens/main_screen/main_screen.dart';
import 'Screens/on_boarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences.setMockInitialValues({});
  bool isFirstTime;
  bool isUserLogin;
  await Prefs.containsKey(Const.IS_FIRST_TIME_KEY)
      ? isFirstTime = await Prefs.isFirstTime
      : isFirstTime = true;
  await Prefs.containsKey(Const.IS_LOGIN_KEY)
      ? isUserLogin = await Prefs.isLogin
      : isUserLogin = false;

  runApp(MyApp(
    isFirstTime: isFirstTime,
    isUserLogin: isUserLogin,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isFirstTime, this.isUserLogin}) : super(key: key);

  final bool? isFirstTime;
  final bool? isUserLogin;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DioHelper.init();
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) => Sizer(
          builder: (context, orientation, deviceType) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.white,
                    titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),

                    elevation: 0.0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                      statusBarIconBrightness: Brightness.dark,
                    )),
                textTheme: TextTheme(
                  headline5: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.black87),
                  subtitle2: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: Colors.grey),
                )),
            darkTheme: ThemeData(
                scaffoldBackgroundColor: Colors.black45,
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.black45,
                    elevation: 0.0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent,
                        statusBarIconBrightness: Brightness.light))),
            themeMode: BlocProvider.of<AppCubit>(context).isLightMode
                ? ThemeMode.light
                : ThemeMode.dark,
            home: isFirstTime! ? const OnBoardingScreen() : isUserLogin! ? MainScreen(): LoginScreen(),
          ),
        ),
      ),
    );
  }
}

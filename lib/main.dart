import 'package:e_commerce/cubit/app_cubit.dart';
import 'package:e_commerce/layout/HomeLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'Screens/on_boarding/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppState>(
        listener: (context,state){},
        builder: (context,state) => Sizer(
          builder: (context,orientation, deviceType) =>
          MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark,
                  )
              ),
              textTheme: TextTheme(
                headline5: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black87),
                subtitle2: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.grey),
              )
            ),
            darkTheme: ThemeData(
                scaffoldBackgroundColor: Colors.black45,
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.black45,
                    elevation: 0.0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent,
                        statusBarIconBrightness: Brightness.light
                    )
                )
            ),
            themeMode: BlocProvider.of<AppCubit>(context).isLightMode? ThemeMode.light:ThemeMode.dark ,
            home:  OnBoardingScreen(),
          ),
        ),
      ),
    );
  }
}

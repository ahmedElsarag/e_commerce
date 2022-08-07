import 'package:e_commerce/cubit/app_cubit.dart';
import 'package:e_commerce/layout/HomeLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        builder: (context,state) => MaterialApp(
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
          home: const HomeLayout(),
        ),
      ),
    );
  }
}

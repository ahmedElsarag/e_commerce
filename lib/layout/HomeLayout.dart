import 'package:e_commerce/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
      body: Container(
        child: ElevatedButton(
            child: Text('theme'),
            onPressed: (){
          BlocProvider.of<AppCubit>(context).changeAppThemeMode();
        }),
      ),
    );
  }
}

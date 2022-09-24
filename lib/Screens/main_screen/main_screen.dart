import 'package:e_commerce/Screens/main_screen/cubit/main_screen_cubit.dart';
import 'package:e_commerce/Screens/main_screen/cubit/main_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return BlocProvider(
  create: (context) => MainScreenCubit(),
  child: BlocConsumer<MainScreenCubit,MainScreenStates>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) =>
       Scaffold(
         bottomNavigationBar: BottomNavigationBar(
           currentIndex: MainScreenCubit.get(context).bottomNavIndex,
           selectedItemColor: Colors.red,
           elevation: 6.0,
           onTap: (index){
             MainScreenCubit.get(context).changeBottomNavIndex(index);
           },
           items: const <BottomNavigationBarItem>[
             BottomNavigationBarItem(icon: Icon(Icons.home_filled,color: Colors.blue,),label: 'Home'),
             BottomNavigationBarItem(icon: Icon(Icons.account_tree_rounded,color: Colors.blue),label: 'Category'),
             BottomNavigationBarItem(icon: Icon(Icons.favorite,color: Colors.blue),label: 'Favorite'),
             BottomNavigationBarItem(icon: Icon(Icons.more_horiz_outlined,color: Colors.blue),label: 'more'),
           ],

         ),
        body: MainScreenCubit.get(context).screens[MainScreenCubit.get(context).bottomNavIndex],
      ),
    ),
);
  }
}

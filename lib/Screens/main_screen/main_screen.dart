import 'package:e_commerce/Screens/main_screen/cubit/main_screen_cubit.dart';
import 'package:e_commerce/Screens/main_screen/cubit/main_screen_states.dart';
import 'package:e_commerce/src/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenCubit(),
      child: BlocConsumer<MainScreenCubit, MainScreenStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: MainScreenCubit.get(context).bottomNavIndex,
            onTap: (index) {
              MainScreenCubit.get(context).changeBottomNavIndex(index);
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/home.svg',
                    width: 20,
                    color: AppColors.lightGrey,
                  ),
                  activeIcon:
                      SvgPicture.asset('assets/svg/home.svg', width: 22),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/category.svg',
                    width: 20,
                    color: AppColors.lightGrey,
                  ),
                  activeIcon:  SvgPicture.asset(
                    'assets/svg/category.svg',
                    width: 22,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/notification.svg',
                    width: 20,
                    color: AppColors.lightGrey,
                  ),
                  activeIcon: SvgPicture.asset(
                'assets/svg/notification.svg',
                width: 22,
              ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/profile.svg',
                    width: 20,
                    color: AppColors.lightGrey,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/svg/profile.svg',
                    width: 22,
                  ),
                  label: ''),
            ],
          ),
          body: MainScreenCubit.get(context)
              .screens[MainScreenCubit.get(context).bottomNavIndex],
        ),
      ),
    );
  }
}

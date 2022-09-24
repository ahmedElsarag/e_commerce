import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Screens/home_screen/component/screen_banner.dart';
import 'package:e_commerce/Screens/home_screen/component/search_bar.dart';
import 'package:e_commerce/Screens/home_screen/cubit/home_cubit.dart';
import 'package:e_commerce/src/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      HomeCubit()
        ..getHomeData()
        ..getHomeCategory(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('ExYu Market'),
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: SvgPicture.asset(
                  'assets/svg/drawer_menu.svg',
                ),
              ),
              leadingWidth: 40,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 15),
                  child: SvgPicture.asset(
                    'assets/svg/shop.svg',
                    width: 20,
                  ),
                )
              ],
            ),
            body: HomeCubit
                .get(context)
                .homeResponse != null
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SearchBar(),
                SizedBox(
                  height: 2.h,
                ),
                ScreenBanner(),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text('category',style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400),),
                        Spacer(),
                        Text('View All',style: TextStyle(color:AppColors.lightGrey,fontSize: 10.sp,fontWeight: FontWeight.w400),),
                      ],
                    )),
                SizedBox(height:1.h),
                HomeCubit
                    .get(context)
                    .categoriesData != null ? Expanded(
                  child: Container(
                      width: 100.w,
                      margin: EdgeInsetsDirectional.only(start: 10),
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  width: 20.w,
                                  height: 16.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage((HomeCubit
                                            .get(context)
                                            .categoriesData
                                            ?.data
                                            ?.data?[index]?.image)!)
                                        , fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(.8),
                                            BlendMode.darken)
                                    ),

                                  ),

                                ),
                                SizedBox(height: .6.h,),
                                Container(
                                    width: 14.w,
                                    child: Text((HomeCubit
                                        .get(context)
                                        .categoriesData
                                        ?.data
                                        ?.data?[index]?.name)!, maxLines: 1,
                                      overflow: TextOverflow.visible,
                                      textAlign: TextAlign.center,))
                              ],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(
                                width: 2.w,
                              ),
                          itemCount: (HomeCubit
                              .get(context)
                              .categoriesData
                              ?.data
                              ?.data
                              ?.length)!)),
                ) : SizedBox.shrink()
              ],
            )
                : CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

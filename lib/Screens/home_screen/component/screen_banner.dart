import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../src/app_color.dart';
import '../cubit/home_cubit.dart';

class ScreenBanner extends StatefulWidget {
  const ScreenBanner({Key? key}) : super(key: key);

  @override
  State<ScreenBanner> createState() => _ScreenBannerState();
}

class _ScreenBannerState extends State<ScreenBanner> {
  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Stack(
        children: [
          CarouselSlider(
              items: HomeCubit.get(context)
                  .homeResponse
                  ?.data
                  ?.banners
                  ?.map((e) => Container(
                  width: 95.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                            e.image!,
                          ),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(.6),
                            BlendMode.darken,)
                      )
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        height: 35,
                        width: 130,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          color: Colors.white24,
                        ),
                        child: const Text(
                          'Special Promo',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'All menswear',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '50% Discount',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                // AppButton.normalButton(
                                //   height: 35,
                                //   width: 100,
                                //   title: 'Buy Now',
                                //   backgroundColor: Colors.white,
                                //   shadow: false,
                                //   titleColor: Colors.black,
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              ))
                  .toList(),
              options: CarouselOptions(
                  height: 25.h,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration:
                  const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index,_){
                    HomeCubit.get(context).carouselIndex = index;
                  }
              )),
          PositionedDirectional(
            bottom: 10,
            end: 20,
            child: AnimatedSmoothIndicator(
              activeIndex: HomeCubit.get(context).carouselIndex,
              count: (HomeCubit.get(context).homeResponse?.data?.banners?.length)!,
              effect: const WormEffect(
                  dotWidth: 3,
                  dotHeight: 10,
                  spacing: 5
              ),

            ),
          )
        ],
      ),
    );
  }
}
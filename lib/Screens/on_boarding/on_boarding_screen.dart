import 'package:e_commerce/Screens/login_screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
   const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    var pageController = PageController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                  controller: pageController,
                  itemCount: 3,
                  onPageChanged: (index){
                  setState(() {
                    index == 2? isLast =true:isLast = false;
                    print(isLast);
                  });

                  },
                  itemBuilder: (context, index) => buildOnBoardingItem()),

            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SmoothPageIndicator(
                      controller: pageController,  // PageController
                      count:  3,
                      effect:  const ExpandingDotsEffect(),  // your preferred effect
                      onDotClicked: (index){

                      }
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: (){

                      isLast?Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context)=>LoginScreen()), (route) => false):pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                    },
                    child: const Icon(Icons.navigate_next),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildOnBoardingItem(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/images/onBoarding1.svg',height: 60.h,),
          SizedBox(height: 20,),
          Text('headline'),
          Text('body'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);


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
                  Spacer(),
                  FloatingActionButton(
                    onPressed: (){
                      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                    },
                    child: Icon(Icons.navigate_next),)
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
          SvgPicture.asset('assets/images/onBoarding1.svg'),
          SizedBox(height: 20,),
          Text('headline'),
          Text('body'),
        ],
      ),
    );
  }
}

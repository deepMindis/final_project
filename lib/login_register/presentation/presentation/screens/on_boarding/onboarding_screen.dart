import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kraba/login_register/presentation/presentation/screens/login_screen.dart';
import 'package:kraba/login_register/presentation/presentation/screens/on_boarding/onboarding_data.dart';
import 'package:kraba/login_register/presentation/presentation/screens/register_screen.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //______________________variables______________________
  var pageController = PageController(initialPage: 0);
  List<PageViewData> pageViewModelData = [];
  late Timer sliderTimer;
  var currentShowIndex = 0;

  //__________________________________________________________________________________________

  @override
  void initState() {
    pageViewModelData.add(PageViewData(
      titleText: 'plan your trips',
      subText: 'book one of your',
      assetsImage: "images/onboarding/introduction1.png",
    ));

    pageViewModelData.add(PageViewData(
      titleText: 'find best deals',
      subText: 'find deals for any',
      assetsImage: "images/onboarding/introduction2.png",
    ));

    pageViewModelData.add(PageViewData(
      titleText: 'best travelling all time',
      subText: 'find deals for any',
      assetsImage: "images/onboarding/introduction3.png",
    ));

    sliderTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (currentShowIndex == 0) {
        pageController.animateTo(MediaQuery.of(context).size.width,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 1) {
        pageController.animateTo(MediaQuery.of(context).size.width * 2,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 2) {
        pageController.animateTo(0,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      }
    });
    super.initState();
  }

  //__________________________________________________________________________________________
  @override
  void dispose() {
    sliderTimer.cancel();
    super.dispose();
  }

  //__________________________________________________________________________________________

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 65, 19, 173),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    pageSnapping: true,
                    onPageChanged: (index) {
                      currentShowIndex = index;
                    },
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      OnboadringData(imageData: pageViewModelData[0]),
                      OnboadringData(imageData: pageViewModelData[1]),
                      OnboadringData(imageData: pageViewModelData[2]),
                    ],
                  ),
                ),
                SmoothPageIndicator(
                  controller: pageController, // PageController
                  count: 3,
                  effect: const WormEffect(
                      activeDotColor: Color.fromARGB(255, 189, 48, 5),
                      dotColor: Colors.grey,
                      dotHeight: 10.0,
                      dotWidth: 10.0,
                      spacing: 5.0), // your preferred effect
                  onDotClicked: (index) {},
                ),
              ],
            ),
          ),
          //__________________________________________________________________________
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  width: 180,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(30)),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LoginScreen()));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 220,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(30)),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const RegisterScreen()));
                    },
                    child: const Text(
                      "Create account",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

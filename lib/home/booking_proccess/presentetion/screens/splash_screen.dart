import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraba/core/shared_preference/cache_helper.dart';
import 'package:kraba/core/utils/constant.dart';
import 'package:kraba/home/booking_proccess/presentetion/controller/booking_cubit.dart';
import 'package:kraba/home/booking_proccess/presentetion/controller/booking_state.dart';
import 'package:kraba/home/booking_proccess/presentetion/screens/home.dart';
import 'package:kraba/login_register/presentation/presentation/screens/login_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 4), _getNext);
  }

  _getNext() {
    // token = CacheHelper.get(key: 'token');
    // if (token != null) {
    //   Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(
    //           builder: (BuildContext context) => const NewHome()),
    //           (Route<dynamic> route) => false);
    // } else {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen()),
        (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 65, 19, 173),

          //___________________________________ Body  ______________________________
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("images/bookingbroccess/start.jpeg"),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  const Color.fromARGB(255, 46, 10, 131).withOpacity(.8),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //___________________________________________ icon  ________________________
                  Container(
                    width: 150,
                    height: 170,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      child: Image.asset(
                        "images/getstartedicon.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DefaultTextStyle(
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('welcome to Hotelo '),
                      ],
                      onTap: () {},
                      isRepeatingAnimation: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

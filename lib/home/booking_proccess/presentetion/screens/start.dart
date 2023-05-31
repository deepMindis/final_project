// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kraba/buttomnav.dart';
import 'package:kraba/home/booking_proccess/presentetion/controller/booking_cubit.dart';
import 'package:kraba/home/explor/screens/explor.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 65, 19, 173),
      //__________________________________ App Bar _____________________
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
        backgroundColor: Colors.white,
        title: Text(
          'Start',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 65, 19, 173),
          ),
        ),
      ),
      //___________________________________ Body  ______________________________
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bookingbroccess/start.jpeg"),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Color.fromARGB(255, 46, 10, 131).withOpacity(.8),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //_____________________________________ text _____________________________
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'You Have No Active Booking Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //______________________________________ ink well ___________________________
                Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        BookingCubit.get(context).getRoomType();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ButtomNavBar()));
                      },
                      child: Text(
                        "Make your Booking Now",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                //____________________________________________________
                SizedBox(
                  height: 80,
                ),
                //___________________________________ text ______________________
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'You Can Either',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
                //_________________________________________________________________
                SizedBox(
                  height: 10,
                ),
                //___________________________________ ink well  _______________
                Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ExploreScreen()));
                      },
                      child: Text(
                        "Explore the Hotel",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                //____________________________________________________________
                SizedBox(
                  height: 20,
                ),
                //___________________________________ text ______________________
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'OR',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
                //_________________________________________________________________
                SizedBox(
                  height: 10,
                ),
                //___________________________________ ink well  _______________
                Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        print("hi");
                      },
                      child: Text(
                        "Check Offers",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                //__________________________________________________________________
                SizedBox(
                  height: 30,
                ),
                //___________________________________________ icon  ________________________
                Container(
                  width: 80,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    child: Image.asset(
                      "images/getstartedicon.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

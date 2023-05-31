// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OverView extends StatelessWidget {
  OverView({super.key});
  //____________________________________ variables
  List overviewimages = [
    {'image': 'images/bookingbroccess/explore/overview1.jpeg'},
    {'image': 'images/bookingbroccess/explore/overview2.jpeg'},
    {'image': 'images/bookingbroccess/explore/overview3.jpeg'},
    {'image': 'images/bookingbroccess/explore/overview4.jpeg'},
    {'image': 'images/bookingbroccess/explore/overview5.jpeg'},
    {'image': 'images/bookingbroccess/explore/overview6.jpeg'},
    {'image': 'images/bookingbroccess/explore/overview7.jpeg'},
    {'image': 'images/bookingbroccess/explore/overview8.jpeg'},
    {'image': 'images/bookingbroccess/explore/overview9.jpeg'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 65, 19, 173),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 36, 3, 112),
            statusBarIconBrightness: Brightness.light),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 65, 19, 173),
            size: 35,
          ),
        ),
        title: const Text(
          "Overview",
          style: TextStyle(
            color: Color.fromARGB(255, 65, 19, 173),
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      //____________________________________________ Body
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: overviewimages.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(overviewimages[index]['image']),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            );
          })),
    );
  }
}

// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kraba/core/utils/constant.dart';
import 'package:kraba/home/booking_proccess/models/cell_model.dart';
import 'package:kraba/home/booking_proccess/models/room_model.dart';
import 'package:kraba/home/booking_proccess/presentetion/controller/booking_cubit.dart';
import 'package:kraba/home/booking_proccess/presentetion/screens/booking_now.dart';
import 'package:kraba/home/booking_proccess/presentetion/screens/rooms.dart';

class RoomDetails extends StatelessWidget {
  CellModel modelRoom;
  RoomDetails({super.key, required this.modelRoom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 65, 19, 173),
      //_________________________________________ App Bar _________________________________
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Color.fromARGB(255, 65, 19, 173),
        ),
        backgroundColor: const Color.fromARGB(255, 65, 19, 173),
        title: Text(
          'Room',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 65, 19, 173),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: 35,
        ),
      ),
      //________________________________________________ Body _________________________
      body: listRoom(modelRoom, context),
    );
  }
}

Widget listRoom(CellModel model, context) => SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
            child: Container(
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: model.data[numRoom!].photo!,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
              height: 200,
            ),
            clipper: CustomClipPath(),
          ),
          //_________________________________ imamge ______________
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Description',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              model.data[numRoom!].roomdescripe!,
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),

          //____________________________________________________________________________
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${model.data[numRoom!].roomcoast.toString()}\$',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      'Smooking ',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      model.data[numRoom!].smokefrindly.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      'Room number ',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      model.data[numRoom!].roomnumber.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //______________________________________________button___________________________
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    onPressed: () {
                      BookingCubit.get(context)
                          .addCell(
                          idRoom:
                          BookingCubit.get(
                              context)
                              .rooms!
                              .data[numRoom!]
                              .id!,
                          idUser: userData!
                              .data!.id!);
                    },
                    icon: Icon(Icons.favorite_border_outlined),
                    iconSize: 38,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Container(
                  width: 180,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(15)),
                  child: MaterialButton(
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookingNow()));
                    }),
                    child: Text(
                      "Book Now",
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

class CustomClipPath extends CustomClipper<Path> {
  //var radius = 1.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    //path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width * .5, size.height - 50, size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

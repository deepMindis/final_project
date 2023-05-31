// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable, non_constant_identifier_names, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraba/home/booking_proccess/presentetion/controller/booking_cubit.dart';
import 'package:kraba/home/booking_proccess/presentetion/controller/booking_state.dart';
import 'package:kraba/home/booking_proccess/presentetion/screens/room_details.dart';
import 'package:kraba/home/booking_proccess/presentetion/screens/rooms.dart';

class RecentCell extends StatelessWidget {
  const RecentCell({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 65, 19, 173),

          //__________________________________________ Body ________________________________________
          body: ConditionalBuilder(
            condition: BookingCubit.get(context).roomCell != null,
            builder: (context) {
              if (BookingCubit.get(context).roomCell!.data.isNotEmpty) {
                return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: BookingCubit.get(context).roomCell!.data.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              numRoom = index;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      RoomDetails(
                                    modelRoom:
                                        BookingCubit.get(context).roomCell!,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  //first Row ____________________
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'room number : ${BookingCubit.get(context).roomCell!.data[index].roomnumber}',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Container(
                                                width: 150,
                                                child: Text(
                                                  BookingCubit.get(context)
                                                      .roomCell!
                                                      .data[index]
                                                      .roomdescripe!,
                                                  maxLines: 4,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      //____ image
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 110,
                                                  child: CachedNetworkImage(
                                                    imageUrl: BookingCubit.get(
                                                            context)
                                                        .roomCell!
                                                        .data[index]
                                                        .photo!,
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            const Icon(
                                                      Icons.error,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              //buttom
                                              Container(
                                                width: 100,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.deepOrange,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    30,
                                                  ),
                                                ),
                                                child: MaterialButton(
                                                  onPressed: () {
                                                    BookingCubit.get(context)
                                                        .deleteCell(
                                                      id: BookingCubit.get(
                                                              context)
                                                          .roomCell!
                                                          .data[index]
                                                          .id!,
                                                    );
                                                  },
                                                  child: const Text(
                                                    "remove",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]);
                    });
              } else {
                return Center(
                  child: Text(
                    'not rooms in your cell',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                );
              }
            },
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:kraba/core/utils/constant.dart';
import 'package:kraba/home/booking_proccess/presentetion/controller/booking_cubit.dart';
import 'package:kraba/home/booking_proccess/presentetion/screens/confirmed.dart';
import 'package:kraba/home/booking_proccess/presentetion/screens/recent.dart';

class Adds extends StatelessWidget {
  const Adds({super.key});

  @override
  Widget build(BuildContext context) {
    BookingCubit.get(context).getRoomsCell(idUser: userData!.data!.id!);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(255, 65, 19, 173),
            bottom: TabBar(
                indicatorColor: Colors.deepOrange,
                labelColor: Colors.white,
                labelStyle: const TextStyle(fontSize: 18),
                onTap: (value) {},
                tabs: const [
                  Tab(
                    child: Text('Recent'),
                  ),
                  Tab(
                    child: Text('confirmed'),
                  )
                ])),
        body: const TabBarView(
          children: [
            RecentCell(),
            Confirmed(),
          ],
        ),
      ),
    );
  }
}

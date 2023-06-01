import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kraba/home/booking_proccess/presentetion/controller/booking_cubit.dart';

class ButtomNavBar extends StatelessWidget {
  const ButtomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BookingCubit.get(context);
    return Scaffold(
        body: BookingCubit.get(context).pages.elementAt(cubit.selected),
        bottomNavigationBar: Container(
          color: const Color.fromARGB(255, 65, 19, 173),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
              iconSize: 25,
              backgroundColor: const Color.fromARGB(255, 65, 19, 173),
              color: Colors.white,
              activeColor: Colors.deepOrange,
              tabBackgroundColor: Colors.grey.shade800,
              gap: 3,
              onTabChange: (value) {
                cubit.buttomNavigation(value);
              },
              selectedIndex: cubit.selected,
              padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  textColor: Colors.white,
                ),
                GButton(
                  icon: Icons.local_offer_outlined,
                  text: 'Offers',
                  textColor: Colors.white,
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'cell',
                  textColor: Colors.white,
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Setting',
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ));
  }
}

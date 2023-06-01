
import 'package:flutter/material.dart';
import 'package:kraba/home/services/presentation/screens/foods_drinks.dart';

class ResturantAndCafe extends StatelessWidget {
  const ResturantAndCafe ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 65, 19, 173),
        appBar: AppBar(
          title: Text('Menue' , style: TextStyle(color:Colors.white , fontSize: 25 , fontWeight: FontWeight.bold),),
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(255, 65, 19, 173),
            bottom: TabBar(
                indicatorColor: Colors.deepOrange,
                labelColor: Colors.white,
                labelStyle: const TextStyle(fontSize: 18),
                onTap: (value) {},
                tabs: const [
                  Tab(
                    child: Text('meals'),
                  ),
                  Tab(
                    child: Text('Sandwich'),
                  ),
                  Tab(
                    child: Text('Drinks'),
                  )
                ])),
        //_____________________________________________________
        body: const TabBarView(
          children: [
            FoodsDrinks(),
            FoodsDrinks(),
            FoodsDrinks(),
          ],
        ),
      ),
    );
  }
}

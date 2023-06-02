
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraba/home/services/presentation/controller/service_cubit.dart';
import 'package:kraba/home/services/presentation/controller/service_state.dart';
import 'package:kraba/home/services/presentation/screens/foods_drinks.dart';

class RestaurantAndCafe extends StatelessWidget {
  const RestaurantAndCafe ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit,ServiceState>(
      listener: (context,state){},
      builder:(context,state)=> DefaultTabController(
        length: 3,
        child: BlocConsumer<ServiceCubit,ServiceState>(
          listener: (context,state){},
          builder:(context,state)=> Scaffold(
            backgroundColor: const Color.fromARGB(255, 65, 19, 173),
            appBar: AppBar(
              title: const Text('Menu' , style: TextStyle(color:Colors.white , fontSize: 25 , fontWeight: FontWeight.bold),),
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
            body:TabBarView(
              children: [
                FoodsDrinks(resturantModel: ServiceCubit.get(context).mealsModel!,),
                FoodsDrinks(resturantModel: ServiceCubit.get(context).mealsModel!,),
                FoodsDrinks(resturantModel: ServiceCubit.get(context).mealsModel!,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

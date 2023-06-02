import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraba/home/services/model/resturant_model.dart';
import 'package:kraba/home/services/presentation/controller/service_cubit.dart';
import 'package:kraba/home/services/presentation/controller/service_state.dart';

class FoodsDrinks extends StatelessWidget {
  RestaurantModel? resturantModel;
  FoodsDrinks({Key? key,required this.resturantModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit,ServiceState>(
      listener: (context,state){},
      builder:(context,state)=> ConditionalBuilder(
        condition: ServiceCubit.get(context).mealsModel !=null,
        builder:(context)=> GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: resturantModel!.data.length,

            itemBuilder: (context , index)
            {
              return InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                          height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)

                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 120,
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(20),
                            child: Container(
                              width: double.infinity,
                              height: 110,
                              child: CachedNetworkImage(
                                imageUrl:
                                    resturantModel!.data[index]
                                    .photo!,
                                errorWidget:
                                    (context, url, error) =>
                                const Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8,) ,
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(resturantModel!.data[index].name! , style: const TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            children: [
                              const Text('price : ' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w700),),
                              const SizedBox(width: 10,),
                              Text("$resturantModel.data[index].price.toString()\$" , style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              );
            }
        ),
        fallback: (context)=>const Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}

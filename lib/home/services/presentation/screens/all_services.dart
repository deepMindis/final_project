// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, must_be_immutable, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraba/home/services/presentation/controller/service_cubit.dart';
import 'package:kraba/home/services/presentation/controller/service_state.dart';

class AllServices extends StatelessWidget {
  AllServices({super.key});

  List servicse = [

    {
      'title': 'Order meal',
      'image': 'images/services_icons/cooking.png',
    },


    {
      'title': 'Laundry',
      'image': 'images/services_icons/Laundry.png',
    },


    {
      'title': 'Fitness room',
      'image': 'images/services_icons/Fitness.jpg',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit,ServiceState>(
      listener: (context,state){},
      builder:(context,state)=> Scaffold(
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
                color: Colors.white,
                size: 35,
              ),
            ),
            title: const Text(
              "All Services",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 65, 19, 173),
          ),
          //__________________________________________________
          body: ConditionalBuilder(
            condition: ServiceCubit.get(context).serviceModel !=null,
            builder:(context)=> ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount:3,
                itemBuilder: (context, index) {
                  return  InkWell(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Container(
                        height: 160,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Row(

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(ServiceCubit.get(context).serviceModel!.data[index].name! , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),
                                    SizedBox(height: 15,) ,
                                    Row(children: [
                                      Text('Starts at:' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold , color: Colors.grey),),
                                      SizedBox(width: 13,),
                                      Text(ServiceCubit.get(context).serviceModel!.data[index].start! , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.grey),),

                                    ],),
                                    SizedBox(height: 8,),
                                    Row(children: [
                                      Text('close at:' , style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold ,  color: Colors.grey),),
                                      SizedBox(width: 13,),
                                      Text(ServiceCubit.get(context).serviceModel!.data[index].end! , style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold ,  color: Colors.grey),),

                                    ],)
                                  ],
                                ),
                              ),
                              Spacer(),
                              //image
                              Container(
                                padding: EdgeInsets.all(15),
                                width: 160,
                                height: 170,
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                  child: Container(
                                    width: double.infinity,
                                    height: 110,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                      ServiceCubit.get(context)
                                          .serviceModel!
                                          .data[index]
                                          .photo!,
                                      errorWidget:
                                          (context, url, error) =>
                                      const Icon(Icons.error),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],

                        ),
                      ),
                    ),
                  );
                }),
            fallback: (context)=>Center(child: CircularProgressIndicator(),),
          )
        ,),
    );
  }
}
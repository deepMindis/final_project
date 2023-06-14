// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraba/home/services/model/resturant_model.dart';
import 'package:kraba/home/services/presentation/controller/service_cubit.dart';
import 'package:kraba/home/services/presentation/controller/service_state.dart';

class OrderDetails extends StatelessWidget {
  RestaurantData? restaurantData;
  OrderDetails({Key? key, required this.restaurantData}) : super(key: key);

  TextEditingController amount = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 65, 19, 173),
      //_________________________________________ App Bar _________________________________
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Color.fromARGB(255, 65, 19, 173),
        ),
        backgroundColor: const Color.fromARGB(255, 65, 19, 173),
        title: const Text(
          'order details',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: 35,
        ),
      ),
      //________________________________________________ Body _________________________
      body: Form(
        key: formKey,
        child: BlocConsumer<ServiceCubit, ServiceState>(
          listener: (context, state) {},
          builder: (context, state) => ConditionalBuilder(
            condition: restaurantData != null,
            builder: (context) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipPath(
                    clipper: CustomClipPath(),
                    child: CachedNetworkImage(
                      imageUrl: restaurantData!.photo!,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                  //_________________________________ imamge ______________

                  Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 65, 19, 173),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurantData!.name!,
                          style: const TextStyle(
                              fontSize: 28, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Price',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '${restaurantData!.price.toString()}\$',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        //separator
                        Container(
                          color: Colors.grey,
                          width: double.infinity,
                          height: 1.5,
                        ),
                        //__________
                        const SizedBox(
                          height: 25,
                        ),
                        //_____________________ text _____________________
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 30),
                              child: Text(
                                'Amount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              width: 100,
                              height: 100,
                              child: TextFormField(
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Add amount';
                                  }
                                  return null;
                                },
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                                cursorColor: Colors.white,
                                controller: amount,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 228, 221, 221)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        //separator
                        Container(
                          color: Colors.grey,
                          width: double.infinity,
                          height: 1.5,
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        Text(
                          restaurantData!.description!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),

                        //__________
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Container(
                            width: 170,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(30)),
                            child: MaterialButton(
                              onPressed: (() {
                                if (formKey.currentState!.validate()) {
                                  showModalBottomSheet(
                                    backgroundColor:
                                        const Color.fromARGB(255, 65, 19, 173),
                                    context: context,
                                    builder: (context) => Container(
                                      height: 300,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 100),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 50),
                                              child: Text(
                                                "confirm order",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  'Amount :',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 7,
                                                ),
                                                Text(
                                                  amount.text,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  'Total Price :',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 7,
                                                ),
                                                Text(
                                                  ("${int.parse(amount.text) * restaurantData!.price!}\$"),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 100,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: Colors.deepOrange,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: MaterialButton(
                                                    onPressed: () {},
                                                    child: const Text(
                                                      "Yes",
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 19,
                                                ),
                                                Container(
                                                  width: 100,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: Colors.deepOrange,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: MaterialButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      "No",
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }),
                              child: const Text(
                                "Order Now",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),

                  //______________________________________________button___________________________
                ],
              ),
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}

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

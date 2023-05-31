// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class BookingNow extends StatefulWidget {
  const BookingNow({super.key});

  @override
  State<BookingNow> createState() => _BookingNowState();
}

class _BookingNowState extends State<BookingNow> {
  //___________________________ variables _______________
  TextEditingController checkindate = TextEditingController();
  TextEditingController checkoutdate = TextEditingController();
  TextEditingController adults = TextEditingController();
  TextEditingController childern = TextEditingController();
  TextEditingController rooms = TextEditingController();

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
        backgroundColor: Colors.white,
        title: Text(
          'Details',
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
          color: Color.fromARGB(255, 65, 19, 173),
          iconSize: 35,
        ),
      ),
      //__________________________________________ body __________
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              //____________________________________ text ________________________

              Container(
                child: Text(
                  'Check-in',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              //____________________________________ textformfield 1  _______________
              SizedBox(
                height: 15,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: checkindate,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  hintText: '1/2/2022',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 228, 220, 220)),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      DateTime? pickeddate1 = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickeddate1 != null) {
                        setState(() {
                          checkindate.text =
                              DateFormat('yyyy-MM-dd').format(pickeddate1);
                        });
                      }
                    },
                    icon: Icon(Icons.calendar_month_outlined),
                    color: Colors.white,
                    iconSize: 25,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 228, 221, 221)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  'Check-Out',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              //____________________________________ textformfield 2 _______________
              SizedBox(
                height: 15,
              ),
              //_________________________________________________

              TextFormField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: checkoutdate,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  hintText: '1/2/2022',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 228, 220, 220)),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      DateTime? pickeddate2 = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickeddate2 != null) {
                        setState(() {
                          checkoutdate.text =
                              DateFormat('yyyy-MM-dd').format(pickeddate2);
                        });
                      }
                    },
                    icon: Icon(Icons.calendar_month_outlined),
                    color: Colors.white,
                    iconSize: 25,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 228, 221, 221)),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //________________________ Row _______________________________
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            'No of Adults',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        //____________________________________ textformfield 2 _______________
                        SizedBox(
                          height: 15,
                        ),
                        //_________________________________________________

                        TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          cursorColor: Colors.white,
                          controller: adults,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 228, 221, 221)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  //_____________________________________________
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            'No of Children',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        //____________________________________ textformfield 2 _______________
                        SizedBox(
                          height: 15,
                        ),
                        //_________________________________________________

                        TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          cursorColor: Colors.white,
                          controller: childern,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 228, 221, 221)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //______________________________________________________________
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  'No of Rooms',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              //____________________________________ textformfield 2 _______________
              SizedBox(
                height: 15,
              ),
              //_________________________________________________

              TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
                cursorColor: Colors.white,
                controller: rooms,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 228, 221, 221)),
                  ),
                ),
              ),
              //____________________________________________
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Container(
                  child: Text(
                    'Total Price : 1658\$',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              //_________________________________________________________________________
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Container(
                  width: 160,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(30)),
                  child: MaterialButton(
                    onPressed: (() {}),
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

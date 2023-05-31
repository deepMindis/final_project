// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraba/core/utils/constant.dart';
import 'package:kraba/home/booking_proccess/presentetion/controller/booking_cubit.dart';
import 'package:kraba/home/booking_proccess/presentetion/controller/booking_state.dart';
import 'package:kraba/home/booking_proccess/presentetion/screens/update.dart';
import 'package:kraba/login_register/presentation/presentation/component/component.dart';
import 'package:kraba/login_register/presentation/presentation/screens/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firstNameControoler =
        TextEditingController(text: userData!.data!.firstname!);
    var lastNameControoler =
        TextEditingController(text: userData!.data!.lastname!);
    var emailController = TextEditingController(text: userData!.data!.email);
    var phoneController =
        TextEditingController(text: "0${userData!.data!.phone}");
    var formKey = GlobalKey<FormState>();

    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {
        if (state is UpdateDataSuccessState) {
          firstNameControoler.text = userData!.data!.firstname!;
          lastNameControoler.text = userData!.data!.lastname!;
          emailController.text = userData!.data!.email!;
          phoneController.text = "0${userData!.data!.phone}";
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 65, 19, 173),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        child: Image.asset(
                          "images/getstartedicon.png",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Profile Data',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(
                          child: defaultTextForm(
                            readOnly: true,
                            controller: firstNameControoler,
                            keyboardType: TextInputType.name,
                            label: 'First Name',
                            prefix: Icons.person,
                            onTap: () {},
                            onChange: (value) {},
                            onSubmit: (value) {},
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'name must be not empty';
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: defaultTextForm(
                            readOnly: true,
                            controller: lastNameControoler,
                            keyboardType: TextInputType.name,
                            label: 'Last Name',
                            prefix: Icons.person,
                            onTap: () {},
                            onChange: (value) {},
                            onSubmit: (value) {},
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'name must be not empty';
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextForm(
                      readOnly: true,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      label: 'Email',
                      prefix: Icons.email,
                      onTap: () {},
                      onChange: (value) {},
                      onSubmit: (value) {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'email must be not empty';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextForm(
                      readOnly: true,
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      label: 'Phone',
                      prefix: Icons.phone,
                      onTap: () {},
                      onChange: (value) {},
                      onSubmit: (value) {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'phone must be not empty';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UpdateScreen()));
                      },
                      child: Row(
                        children: const [
                          Text(
                            'Update',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const LoginScreen()),
                            (Route<dynamic> route) => false);
                      },
                      child: Row(
                        children: const [
                          Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

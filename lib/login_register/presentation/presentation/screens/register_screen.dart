import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:kraba/login_register/presentation/presentation/component/component.dart';
import 'package:kraba/login_register/presentation/presentation/component/toast.dart';
import 'package:kraba/login_register/presentation/presentation/controller/cubit/hotel_login_cubit.dart';
import 'package:kraba/login_register/presentation/presentation/controller/cubit/hotel_login_state.dart';
import 'package:kraba/login_register/presentation/presentation/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var firstname = TextEditingController();
    var secondName = TextEditingController();
    var emailAddress = TextEditingController();
    var password = TextEditingController();
    var passwordAgain = TextEditingController();
    var phoneNumber = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (BuildContext context) => HotelLoginCubit(),
      child: BlocConsumer<HotelLoginCubit, HotelLoginStates>(
        listener: (context, state) {
          if (state is HotelRegisterSuccessState) {
            if (state.registerModel.status == 0) {
              showToast(
                text: state.registerModel.message.toString(),
                state: ToastState.SUCCESS,
              );
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const LoginScreen()),
                (Route<dynamic> route) => false,
              );

              // CacheHelper.saveData(
              //         key: 'token', value: state.registerUser.data!.token)
              //     .then((value) {
              //   token = state.registerUser.data!.token;
              //   // Navigator.pushAndRemoveUntil(
              //   //   context,
              //   //   MaterialPageRoute(
              //   //       builder: (BuildContext context) => const HomeScreen()),
              //   //       (Route<dynamic> route) => false,
              //   // );
              // });
            } else {
              showToast(
                text: state.registerModel.message.toString(),
                state: ToastState.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 65, 19, 173),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      //_________________________________________________________________________
                      const SizedBox(
                        width: 150,
                        height: 150,
                        child: Image(image: AssetImage("images/login.png")),
                      ),
                      //_________________________________________________________________________
                      const SizedBox(
                        height: 30,
                      ),
                      //_________________________________________________________________________
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: defaultTextForm(
                                controller: firstname,
                                keyboardType: TextInputType.name,
                                label: 'First Name',
                                prefix: Icons.person,
                                onSubmit: (value) {},
                                onChange: (value) {},
                                onTap: () {},
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'please enter your first name';
                                  }
                                },
                              ),
                            ),
                          ),
                          //______________________
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: defaultTextForm(
                                controller: secondName,
                                keyboardType: TextInputType.name,
                                label: 'Second Name',
                                prefix: Icons.person,
                                onSubmit: (value) {},
                                onChange: (value) {},
                                onTap: () {},
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'please enter your second name';
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      //_________________________________________________________________________
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: defaultTextForm(
                          controller: emailAddress,
                          keyboardType: TextInputType.name,
                          label: 'Email Address',
                          prefix: Icons.person,
                          onSubmit: (value) {},
                          onChange: (value) {},
                          onTap: () {},
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your email';
                            }
                          },
                        ),
                      ),
                      //_________________________________________________________________________
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: defaultTextForm(
                          controller: password,
                          keyboardType: TextInputType.text,
                          label: 'Password',
                          prefix: Icons.lock_outline,
                          suffix: HotelLoginCubit.get(context).suffixIcon,
                          suffixPress: () {
                            HotelLoginCubit.get(context).changeSuffixIcon();
                          },
                          onSubmit: (value) {},
                          onChange: (value) {},
                          onTap: () {},
                          isPassword: HotelLoginCubit.get(context).isPassword,
                          validate: (String? value) {
                            if (value!.length < 6) {
                              return 'Password must be not less than 6 digits';
                            }
                          },
                        ),
                      ),
                      //_________________________________________________________________________
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: defaultTextForm(
                          controller: passwordAgain,
                          keyboardType: TextInputType.text,
                          label: 'Confirm Password',
                          prefix: Icons.lock_outline,
                          suffix: HotelLoginCubit.get(context).suffixIcon,
                          suffixPress: () {
                            HotelLoginCubit.get(context).changeSuffixIcon();
                          },
                          onSubmit: (value) {},
                          onChange: (value) {},
                          onTap: () {},
                          isPassword: HotelLoginCubit.get(context).isPassword,
                          validate: (String? value) {
                            if (value != password.text) {
                              return 'enter the same password';
                            }
                          },
                        ),
                      ),
                      //_________________________________________________________________________
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: defaultTextForm(
                          controller: phoneNumber,
                          keyboardType: TextInputType.phone,
                          label: 'phone',
                          prefix: Icons.phone,
                          onSubmit: (value) {},
                          onChange: (value) {},
                          onTap: () {},
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your phone';
                            }
                          },
                        ),
                      ),
                      //________________________________________________________________________
                      const SizedBox(
                        height: 30,
                      ),
                      //________________________________________________________________________
                      ConditionalBuilder(
                        condition: state is! HotelRegisterLoadingState,
                        builder: (context) => Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: defaultButton(
                            background: Colors.deepOrange,
                            width: 150,
                            text: 'register',
                            function: () {
                              if (formKey.currentState!.validate()) {
                                HotelLoginCubit.get(context).userRegister(
                                  firstName: firstname.text,
                                  lastName: secondName.text,
                                  email: emailAddress.text,
                                  password: password.text,
                                  phone: phoneNumber.text,
                                );
                              }
                            },
                            isUpperCase: true,
                            radius: 40.0,
                          ),
                        ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                      //_________________________________________________________________________
                      const SizedBox(
                        height: 15,
                      ),
                      //_________________________________________________________________________
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Row(
                          children: [
                            const Text(
                              "Already have account?",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const LoginScreen()));
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.deepOrange,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

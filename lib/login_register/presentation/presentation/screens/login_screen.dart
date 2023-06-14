import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraba/home/booking_proccess/presentetion/controller/booking_cubit.dart';
import 'package:kraba/home/booking_proccess/presentetion/screens/start.dart';
import 'package:kraba/login_register/presentation/presentation/component/component.dart';
import 'package:kraba/login_register/presentation/presentation/component/toast.dart';
import 'package:kraba/login_register/presentation/presentation/controller/cubit/hotel_login_cubit.dart';
import 'package:kraba/login_register/presentation/presentation/controller/cubit/hotel_login_state.dart';
import 'package:kraba/login_register/presentation/presentation/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailAddress = TextEditingController();
    var password = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => HotelLoginCubit(),
      child: BlocConsumer<HotelLoginCubit, HotelLoginStates>(
        listener: (context, state) {
          if (state is HotelLoginSuccessState) {
            if (state.loginModel.status == 0) {
              showToast(
                text: state.loginModel.message.toString(),
                state: ToastState.SUCCESS,
              );
              BookingCubit.get(context).buttomNavigation(0);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const StartScreen()));
            } else {
              showToast(
                text: state.loginModel.message.toString(),
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
                padding: const EdgeInsets.only(top: 100),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //_________________________________________________________________________
                      const SizedBox(
                        width: 150,
                        height: 150,
                        child: Image(image: AssetImage("images/login.png")),
                      ),
                      //_________________________________________________________________________
                      const SizedBox(
                        height: 40,
                      ),
                      //_________________________________________________________________________
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: defaultTextForm(
                          controller: emailAddress,
                          keyboardType: TextInputType.emailAddress,
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                          onSubmit: (value) {},
                          onChange: (value) {},
                          onTap: () {},
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Email must be not empty';
                            }
                          },
                        ),
                      ),
                      //_________________________________________________________________________
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: defaultTextForm(
                          controller: password,
                          keyboardType: TextInputType.text,
                          label: 'Password',
                          prefix: Icons.lock_outline,
                          suffix: HotelLoginCubit.get(context).suffixIcon,
                          suffixPress: () {
                            HotelLoginCubit.get(context).changeSuffixIcon();
                          },
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              HotelLoginCubit.get(context).userLogin(
                                email: emailAddress.text,
                                password: password.text,
                              );
                            }
                          },
                          onChange: (value) {},
                          onTap: () {},
                          isPassword: HotelLoginCubit.get(context).isPassword,
                          validate: (String? value) {
                            if (value!.length < 6) {
                              return 'Password must be not empty';
                            }
                          },
                        ),
                      ),
                      //_________________________________________________________________________
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 200),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forget your passwrd?",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                      ),
                      //_________________________________________________________________________
                      const SizedBox(
                        height: 40,
                      ),
                      //_________________________________________________________________________
                      Container(
                        width: 180,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(30)),
                        child: MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              HotelLoginCubit.get(context).userLogin(
                                email: emailAddress.text,
                                password: password.text,
                              );
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      //_________________________________________________________________________
                      const SizedBox(
                        height: 30,
                      ),
                      //_________________________________________________________________________
                      Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: Row(
                          children: [
                            const Text(
                              "Don't have an account?",
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
                                              const RegisterScreen()));
                                },
                                child: const Text(
                                  "Sign Up",
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

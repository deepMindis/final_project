import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraba/core/utils/constant.dart';
import 'package:kraba/home/booking_proccess/presentetion/controller/booking_cubit.dart';
import 'package:kraba/home/booking_proccess/presentetion/controller/booking_state.dart';
import 'package:kraba/login_register/presentation/presentation/component/component.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key}) : super(key: key);

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
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 65, 19, 173),
        appBar: AppBar(
          title: const Text('Update'),
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
          backgroundColor: const Color.fromARGB(255, 65, 19, 173),
        ),
        body: ConditionalBuilder(
          condition: userData != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Column(
                    children: [
                      //if(state is ShopLoadingUpdateUserState)
                      //const LinearProgressIndicator(),
                      //const SizedBox(
                      //height: 20.0,
                      //),
                      Row(
                        children: [
                          Expanded(
                            child: defaultTextForm(
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
                        height: 35.0,
                      ),
                      defaultButton(
                        radius: 5.0,
                        text: 'update',
                        background: Colors.deepOrange,
                        function: () {
                          if (formKey.currentState!.validate()) {
                            BookingCubit.get(context).updateUserData(
                              id: userData!.data!.id!,
                              firstName: firstNameControoler.text,
                              lastName: lastNameControoler.text,
                              email: emailController.text,
                              phone: phoneController.text,
                            );
                            Navigator.pop(context);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

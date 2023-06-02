import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraba/home/booking_proccess/presentetion/controller/booking_cubit.dart';
import 'package:kraba/home/booking_proccess/presentetion/controller/booking_state.dart';
import 'package:kraba/home/services/presentation/controller/service_cubit.dart';
import 'package:kraba/home/services/presentation/screens/all_services.dart';
import 'package:kraba/login_register/presentation/presentation/controller/cubit/hotel_login_cubit.dart';
import 'core/dio/dio_helper.dart';
import 'core/shared_preference/cache_helper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => BookingCubit()..getRoomType(),
        ),
        BlocProvider(
          create: (BuildContext context) => HotelLoginCubit(),

        ),BlocProvider(
          create: (BuildContext context) => ServiceCubit()..getAllService()..getMeals(),

        ),
      ],
      child: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {},
        builder: (context, satae) {
          return MaterialApp(

            title: 'HOTELLO',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: AllServices(),

          );
        },
      ),
    );
  }
}

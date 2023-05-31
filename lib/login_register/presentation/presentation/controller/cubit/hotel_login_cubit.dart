import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraba/core/dio/dio_helper.dart';
import 'package:kraba/core/utils/constant.dart';
import 'package:kraba/login_register/presentation/login_model/login_model.dart';
import 'package:kraba/login_register/presentation/presentation/controller/cubit/hotel_login_state.dart';

class HotelLoginCubit extends Cubit<HotelLoginStates> {
  HotelLoginCubit() : super(HotelLoginInitialState());

  static HotelLoginCubit get(context) => BlocProvider.of(context);

  HotelLoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(HotelLoginLoadingState());
    DioHelper.postData(
      url: "users/authenticated",
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = HotelLoginModel.fromJson(value.data);
      if (kDebugMode) {
        print(loginModel!.message.toString());
      }
      emit(HotelLoginSuccessState(loginModel!));
      userData = loginModel;
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(HotelLoginErrorState(error));
    });
  }

  HotelLoginModel? registerModel;

  void userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(HotelRegisterLoadingState());
    DioHelper.postData(
      url: "users/register",
      data: {
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      registerModel = HotelLoginModel.fromJson(value.data);
      emit(HotelRegisterSuccessState(registerModel!));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(HotelRegisterErrorState(error));
    });
  }

  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;
  void changeSuffixIcon() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(HotelPasswordVisibilityState());
  }
}

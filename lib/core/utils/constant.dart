import 'package:flutter/material.dart';
import 'package:kraba/core/shared_preference/cache_helper.dart';
import 'package:kraba/login_register/presentation/login_model/login_model.dart';
import 'package:kraba/login_register/presentation/presentation/screens/login_screen.dart';

String? token = '';

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      token = CacheHelper.get(key: 'token');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginScreen()));
    }
  });
}

HotelLoginModel? userData;

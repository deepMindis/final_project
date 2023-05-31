import 'package:kraba/login_register/presentation/login_model/login_model.dart';

abstract class HotelLoginStates {}

class HotelLoginInitialState extends HotelLoginStates {}

class HotelLoginLoadingState extends HotelLoginStates {}

class HotelLoginSuccessState extends HotelLoginStates {
  final HotelLoginModel loginModel;
  HotelLoginSuccessState(this.loginModel);
}

class HotelLoginErrorState extends HotelLoginStates {
  final String error;
  HotelLoginErrorState(this.error);
}

class HotelRegisterLoadingState extends HotelLoginStates {}

class HotelRegisterSuccessState extends HotelLoginStates {
  final HotelLoginModel registerModel;
  HotelRegisterSuccessState(this.registerModel);
}

class HotelRegisterErrorState extends HotelLoginStates {
  final String error;
  HotelRegisterErrorState(this.error);
}

class HotelPasswordVisibilityState extends HotelLoginStates {}

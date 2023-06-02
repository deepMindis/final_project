import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraba/core/dio/dio_helper.dart';
import 'package:kraba/home/services/model/resturant_model.dart';
import 'package:kraba/home/services/model/service_model.dart';
import 'package:kraba/home/services/presentation/controller/service_state.dart';


class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitialState());

  static ServiceCubit get(context) => BlocProvider.of(context);


  ServiceModel? serviceModel;
  void getAllService(){
      emit(AllServiceLoadingState());
      DioHelper.getData(url: "services").then((value) {
        serviceModel = ServiceModel.fromJson(value.data);
        emit(AllServiceSuccessState());
          print(serviceModel!.message.toString());

      }).catchError((error) {

          print(error);
        emit(AllServiceErrorState());
      });

  }
  RestaurantModel? mealsModel;
  void getMeals(){
    emit(MealsLoadingState());
    DioHelper.getData(url: "services/getMeals").then((value) {
      mealsModel = RestaurantModel.fromJson(value.data);
      emit(MealsSuccessState());
      print(mealsModel!.message.toString());

    }).catchError((error) {

      print(error);
      emit(MealsErrorState());
    });

  }

}

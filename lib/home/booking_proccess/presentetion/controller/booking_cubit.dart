import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraba/core/dio/dio_helper.dart';
import 'package:kraba/core/utils/constant.dart';
import 'package:kraba/home/booking_proccess/models/cell_model.dart';
import 'package:kraba/home/booking_proccess/models/room_model.dart';
import 'package:kraba/home/booking_proccess/models/room_type_model.dart';
import 'package:kraba/home/booking_proccess/presentetion/controller/booking_state.dart';
import 'package:kraba/home/booking_proccess/presentetion/screens/adds.dart';
import 'package:kraba/home/booking_proccess/presentetion/screens/home.dart';
import 'package:kraba/home/booking_proccess/presentetion/screens/offers.dart';
import 'package:kraba/home/booking_proccess/presentetion/screens/setting.dart';
import 'package:kraba/login_register/presentation/login_model/login_model.dart';
import 'package:kraba/login_register/presentation/presentation/component/toast.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitialState());

  static BookingCubit get(context) => BlocProvider.of(context);
  List<Widget> pages = [
    const NewHome(),
    const Offers(),
    const Adds(),
    const SettingsScreen(),
  ];
  var selected = 0;
  void buttomNavigation(index) {
    selected = index;
    emit(ButtomNavigationState());
  }

  RoomTypeModel? roomType;

  void getRoomType() {
    emit(RoomTypeLoadingState());
    DioHelper.getData(url: "roomType/allRoomTypes").then((value) {
      roomType = RoomTypeModel.fromJson(value.data);
      emit(RoomTypeSuccessState());
      if (kDebugMode) {
        print(roomType!.message.toString());
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(RoomTypeErrorState());
    });
  }

  CellModel? rooms;

  void getRooms({
    required String idRoomType,
  }) {
    rooms = null;
    emit(RoomLoadingState());
    DioHelper.postData(url: "room/getRooms", data: {
      "roomtypeID": idRoomType,
    }).then((value) {
      rooms = CellModel.fromJson(value.data);
      emit(RoomSuccessState());
      if (kDebugMode) {
        print(rooms!.message.toString());
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(RoomErrorState());
    });
  }

  CellModel? roomCell;
  void getRoomsCell({
    required String idUser,
  }) {
    roomCell = null;
    emit(GetCellLoadingState());
    DioHelper.postData(url: "cell/getAllCell", data: {
      "user_id": idUser,
    }).then((value) {
      roomCell = CellModel.fromJson(value.data);
      emit(GetCellSuccessState());
      if (kDebugMode) {
        print(rooms!.message.toString());
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(GetCellErrorState());
    });
  }

  void addCell({
    required String idRoom,
    required String idUser,
  }) {
    emit(AddCellLoadingState());
    DioHelper.postData(url: "cell/addnewCell", data: {
      "user_id": idUser,
      "room_id": idRoom,
    }).then((value) {
      emit(AddCellSuccessState());
      if (kDebugMode) {
        showToast(
          text: value.data["message"].toString(),
          state: ToastState.SUCCESS,
        );
        print(value.data["message"].toString());
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(AddCellErrorState());
    });
  }

  void deleteCell({
    required String id,
  }) {
    emit(DeleteCellLoadingState());
    DioHelper.postData(url: "cell/deleteFromCell", data: {
      "id": id,
    }).then((value) {
      emit(DeleteCellSuccessState());
      showToast(
        text: value.data["message"].toString(),
        state: ToastState.SUCCESS,
      );
      roomCell = null;
      getRoomsCell(idUser: userData!.data!.id!);
      print(value.data["message"].toString());
    }).catchError((error) {
      print(error);

      emit(DeleteCellErrorState());
    });
  }

  void updateUserData({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) {
    emit(UpdateDataLoadingState());
    DioHelper.postData(url: "users/updateData", data: {
      "id": id,
      "firstname": firstName,
      "lastname": lastName,
      "email": email,
      "phone": phone,
    }).then((value) {
      emit(UpdateDataSuccessState());
      userData = HotelLoginModel.fromJson(value.data);
      showToast(
        text: value.data["message"].toString(),
        state: ToastState.SUCCESS,
      );

      print(value.data["message"].toString());
    }).catchError((error) {
      print(error);

      emit(UpdateDataErrorState());
    });
  }
}

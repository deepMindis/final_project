abstract class BookingState {}

class BookingInitialState extends BookingState {}

class RoomTypeLoadingState extends BookingState {}

class RoomTypeSuccessState extends BookingState {}

class RoomTypeErrorState extends BookingState {}

class RoomLoadingState extends BookingState {}

class RoomSuccessState extends BookingState {}

class RoomErrorState extends BookingState {}

class AddCellLoadingState extends BookingState {}

class AddCellSuccessState extends BookingState {}

class AddCellErrorState extends BookingState {}

class DeleteCellLoadingState extends BookingState {}

class DeleteCellSuccessState extends BookingState {}

class DeleteCellErrorState extends BookingState {}

class GetCellLoadingState extends BookingState {}

class GetCellSuccessState extends BookingState {}

class GetCellErrorState extends BookingState {}

class UpdateDataLoadingState extends BookingState {}

class UpdateDataSuccessState extends BookingState {}

class UpdateDataErrorState extends BookingState {}

class ButtomNavigationState extends BookingState {}

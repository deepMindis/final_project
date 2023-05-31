class RoomTypeModel {
  int? status;
  String? message;
  List<RoomTypeData> data = [];

  RoomTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    json['data'].forEach((element) {
      data.add(RoomTypeData.fromJson(element));
    });
  }
}

class RoomTypeData {
  String? id;
  String? nameRoom;
  String? photo;
  RoomTypeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameRoom = json['nameroom'];
    photo = json['photo'];
  }
}

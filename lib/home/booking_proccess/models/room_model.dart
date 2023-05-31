class RoomModel {
  int? status;
  String? message;
  List<RoomData> data = [];

  RoomModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    json['data'].forEach((element) {
      data.add(RoomData.fromJson(element));
    });
  }
}

class RoomData {
  String? id;
  int? roomnumber;
  int? petfrindly;
  String? smokefrindly;
  String? roomdescripe;
  String? roomtypeid;
  int? roomcoast;
  int? roomstate;
  String? photo;
  RoomData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomnumber = json['roomnumber'];
    petfrindly = json['petfrindly'];
    smokefrindly = json['smokefrindly'];
    roomdescripe = json['roomdescripe'];
    roomtypeid = json['roomtypeid'];
    roomcoast = json['roomcoast'];
    roomstate = json['roomstate'];
    photo = json['photo'];
  }
}

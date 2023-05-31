class CellModel {
  int? status;
  String? message;
  List<CellData> data = [];

  CellModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    json['data'].forEach((element) {
      data.add(CellData.fromJson(element));
    });
  }
}

class CellData {
  String? id;
  int? roomnumber;
  int? petfrindly;
  String? smokefrindly;
  String? roomdescripe;
  String? roomtypeid;
  int? roomcoast;
  int? roomstate;
  String? photo;
  String? userId;
  String? roomId;
  int? status;
  CellData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomnumber = json['roomnumber'];
    petfrindly = json['petfrindly'];
    smokefrindly = json['smokefrindly'];
    roomdescripe = json['roomdescripe'];
    roomtypeid = json['roomtypeid'];
    roomcoast = json['roomcoast'];
    roomstate = json['roomstate'];
    photo = json['photo'];
    userId = json['user_id'];
    roomId = json['room_id'];
    status = json['status'];
  }
}

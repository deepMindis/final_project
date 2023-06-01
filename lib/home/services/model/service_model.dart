class ServiceModel {
  int? status;
  String? message;
  List<ServiceData> data = [];

  ServiceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    json['data'].forEach((element) {
      data.add(ServiceData.fromJson(element));
    });
  }
}

class ServiceData {
  String? id;
  String? name;
  String? photo;
  String? start;
  String? end;
  int? price;
  ServiceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    name = json['name'];
    start = json['start_in'];
    end = json['end_in'];
    price=json['price'];
  }
}

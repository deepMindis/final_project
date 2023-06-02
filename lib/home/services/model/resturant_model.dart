class RestaurantModel {
  int? status;
  String? message;
  List<RestaurantData> data = [];

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    json['data'].forEach((element) {
      data.add(RestaurantData.fromJson(element));
    });
  }
}

class RestaurantData {
  String? id;
  String? name;
  String? description;
  String? photo;
  int? price;
  RestaurantData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    photo = json['photo'];
    price=json['price'];

  }
}

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
  String? restuarantId;
  String? name;
  String? description;
  String? photo;
  int? price;
  RestaurantData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restuarantId = json['resturant_type_id'];
    name = json['name'];
    description = json['description'];
    photo = json['photo'];
    price = json['price'];
  }
}

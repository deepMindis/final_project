class HotelLoginModel {
  int? status;
  String? message;
  UserDate? data;

  HotelLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserDate.fromJson(json['data']) : null;
  }
}

class UserDate {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  int? phone;
  String? token;

  UserDate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    password = json['password'];
    email = json['email'];
    phone = json['phone'];
    token = json['token'];
  }
}

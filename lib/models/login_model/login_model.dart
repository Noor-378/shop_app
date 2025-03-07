class LoginModel {
  String? message;
  late bool status;
  UserData? data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] != null ? UserData.fromJson(json["data"]) :null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? poinsts;
  int? credit;
  String? token;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    image = json["image"];
    poinsts = json["poinsts"];
    credit = json["credit"];
    token = json["token"];
  }
}

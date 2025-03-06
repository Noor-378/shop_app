class LoginModel {
  String? message;
  bool? status;
  UserData? data;
  // LoginModel({
  //   this.message,
  //   this.status,
  //   this.data,
  // });
  
  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"];
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
  // UserData({
  //   this.id,
  //   this.name,
  //   this.email,
  //   this.phone,
  //   this.image,
  //   this.poinsts,
  //   this.credit,
  //   this.token,
  // });

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

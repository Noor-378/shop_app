class LoginModel {
  final String? message;
  final bool? status;
  LoginModel({
     this.message,
     this.status,
  });
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
  UserData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.poinsts,
    this.credit,
    this.token,
  });

  UserData.fromJson(Map<String, dynamic> json){}
}

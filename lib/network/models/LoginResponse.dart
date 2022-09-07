class LoginResponse{

  bool? status;
  String? message;
  UserDataBean? data;

  LoginResponse.fromJson(Map<String,dynamic> json){
    status = json['status'];
    message = json['message'];
    data = json['data'] !=null? UserDataBean.fromJson(json['data']):null;

  }

}

class UserDataBean{

  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;


  UserDataBean.fromJson(Map<String,dynamic> json){
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
  }
}
// Created by Sanjeev Sangral on 19/09/21.
class LoginRequestPost{
  String email;
  String password;

  LoginRequestPost({this.email, this.password});

  factory LoginRequestPost.fromJson(Map<String, dynamic> json) => LoginRequestPost(
    password: json["password"] == null ? null : json["password"],
    email: json["email"] == null ? null : json["email"],
  );

  Map<String, dynamic> toJson() => {
    "password": password == null ? null : password,
    "email": email == null ? null : email,
  };
}
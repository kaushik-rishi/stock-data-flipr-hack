// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

import 'dart:convert';

UserLoginModel? userLoginModelFromJson(String str) =>
    UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel? data) =>
    json.encode(data!.toJson());

class UserLoginModel {
  UserLoginModel({
    this.msg,
    this.token,
    this.result,
  });

  String? msg;
  String? token;
  List<Result?>? result;

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        msg: json["msg"],
        token: json["token"],
        result: json["result"] == null
            ? []
            : List<Result?>.from(
                json["result"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "token": token,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x!.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  int? id;
  String? name;
  String? email;
  String? password;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
      };
}

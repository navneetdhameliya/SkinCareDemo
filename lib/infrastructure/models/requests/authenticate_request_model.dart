// To parse this JSON data, do
//
//     final authenticateRequestModel = authenticateRequestModelFromJson(jsonString);

import 'dart:convert';

AuthenticateRequestModel authenticateRequestModelFromJson(String str) => AuthenticateRequestModel.fromJson(json.decode(str));

String authenticateRequestModelToJson(AuthenticateRequestModel data) => json.encode(data.toJson());

class AuthenticateRequestModel {
  String? userNameOrEmailAddress;
  String? password;
  bool? rememberClient;
  bool? termsAgreed;

  AuthenticateRequestModel({
    this.userNameOrEmailAddress,
    this.password,
    this.rememberClient,
    this.termsAgreed,
  });

  factory AuthenticateRequestModel.fromJson(Map<String, dynamic> json) => AuthenticateRequestModel(
    userNameOrEmailAddress: json["userNameOrEmailAddress"],
    password: json["password"],
    rememberClient: json["rememberClient"],
    termsAgreed: json["termsAgreed"],
  );

  Map<String, dynamic> toJson() => {
    "userNameOrEmailAddress": userNameOrEmailAddress,
    "password": password,
    "rememberClient": rememberClient,
    "termsAgreed": termsAgreed,
  };
}

// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.user,
    this.token,
  });

  User user;
  String token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.role,
    this.companyName,
    this.gst,
    this.phone,
    this.address,
    this.userNotes,
    this.status,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.showRates,
  });

  int id;
  String name;
  String email;
  String role;
  dynamic companyName;
  dynamic gst;
  String phone;
  dynamic address;
  dynamic userNotes;
  int status;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int showRates;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        companyName: json["company_name"],
        gst: json["gst"],
        phone: json["phone"],
        address: json["address"],
        userNotes: json["user_notes"],
        status: json["status"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        showRates: json["show_rates"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "company_name": companyName,
        "gst": gst,
        "phone": phone,
        "address": address,
        "user_notes": userNotes,
        "status": status,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "show_rates": showRates,
      };
}

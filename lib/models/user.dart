//import 'package:firestoredatabase/operations.dart';

import 'dart:convert';

import 'package:momo/database/firebase.dart';

class User implements Serializable {
  String? firstname;
  String? number;
  String? credit;
  String? data;
  String? sms;
  String? password;
  String? id;

  User({
    this.firstname,
    this.number,
    this.id,
    this.credit,
    this.data,
    this.sms,
    this.password,
  });
  factory User.fromJson(Map? json) => User(
        id: json?["id"],
        firstname: json?["firstname"],
        number: json?["number"],
        credit: json?["credit"],
        data: json?["data"],
        sms: json?["sms"],
        password: json?["password"],
      );
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "firstname": firstname,
      "number": number,
      "credit": credit,
      "data": data,
      "password": password,
      "sms": sms,
    };
  }

  static User fromString(String userString) {
    return User.fromJson(jsonDecode(userString));
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}

import 'dart:convert';

import 'package:get/state_manager.dart';

import 'package:http/http.dart' as http;

class UserController extends GetxController {
  RxString username = ''.obs;
  postChange() async {
    ChangeUsername ch =
        ChangeUsername(username: username.value, id: 1.toString());
    print("..........cc..............." + username.value);
    print(changeUsernameToJson(ch));
    var res = await http.post(
        Uri.parse('http://192.168.8.102:7000/user/changeusername'),
        body: {'id': '1', 'username': username.value});
    print(res.statusCode);
  }
}
// To parse this JSON data, do
//
//     final changeUsername = changeUsernameFromJson(jsonString);

ChangeUsername changeUsernameFromJson(String str) =>
    ChangeUsername.fromJson(json.decode(str));

String changeUsernameToJson(ChangeUsername data) => json.encode(data.toJson());

class ChangeUsername {
  ChangeUsername({
    this.id,
    this.username,
  });

  String id;
  String username;

  factory ChangeUsername.fromJson(Map<String, dynamic> json) => ChangeUsername(
        id: json["id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
      };
}

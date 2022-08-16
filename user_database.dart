// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);
import 'dart:convert';
import 'package:widget_app/models/user_table.dart';

List<UserDB> userFromJson(String str) =>
    List<UserDB>.from(json.decode(str).map((x) => UserDB.fromJson(x)));

String userToJson(List<UserDB> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDB {
  UserDB({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
  });

  int? id;
  String? name;
  String? email;
  String? username;

  factory UserDB.fromJson(Map<String, Object?> json) => UserDB(
    id: json[UserTable.id] as int,
    name: json[UserTable.name] as String,
    email: json[UserTable.email]as String,
    username: json[UserTable.username]as String,
  );

  Map<String, Object?> toJson() => {
    UserTable.id : id,
    UserTable.name: name,
    UserTable.email: email,
    UserTable.username: username,
  };

  UserDB copy(
      {int? id,
        String? name,
        String? email,
        String? username}) =>
      UserDB(id: id, name: name, email: email, username: username);
}

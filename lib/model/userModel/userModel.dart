// ignore_for_file: file_names

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  String id;
  String nom;
  String email;
  UserModel({required this.id, required this.nom, required this.email});
  static UserModel? sessionUser;
  factory UserModel.fromJson(Map<String, dynamic> i) =>
      UserModel(id: i['id'], nom: i['nom'], email: i['email']);
  Map<String, dynamic> toMap() => {"id": id, "nom": nom, "email": email};

  static void saveUser(UserModel user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = json.encode(user.toMap());
    pref.setString("user", data);
    // ignore: deprecated_member_use
    pref.commit();
  }

  static getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = pref.getString("user");
    if (data != null) {
      var decode = json.decode(data);
      var user = UserModel.fromJson(decode);
      sessionUser = user;
    } else {
      sessionUser = null;
    }
  }

  static void logOut() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    p.remove("user");
    sessionUser = null;
    // ignore: deprecated_member_use
    p.commit();
  }
}

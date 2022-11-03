import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../model/user_model.dart';

class LocalStorageUser {
  static setUserData(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('User', json.encode(userModel.toJson()));
  }

  static Future<UserModel> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return UserModel.fromJson(
        json.decode(prefs.getString('User')!) as Map<dynamic, dynamic>);
  }

  static clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}


// class LocalStorageUser extends GetxController {
//   Future<UserModel?> get getUser async {
//     try {
//       UserModel userModel = await _getUser();
//       if (userModel == null) {
//         return null;
//       }
//       return userModel;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   _getUser() async {
//     SharedPreferences presf = await SharedPreferences.getInstance();
//     var value = presf.getString('user');
//   }

//   setUser(UserModel userModel) async {
//     SharedPreferences presf = await SharedPreferences.getInstance();

//     await presf.setString('user', json.encode(userModel.toJson()));
//   }

//   void deleteUser() async {
//     SharedPreferences presf = await SharedPreferences.getInstance();

//     await presf.clear();
//   }
// }

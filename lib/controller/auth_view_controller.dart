import 'package:sertifikasi_mobile/model/user_model.dart';
import 'package:sertifikasi_mobile/services/flutter_user.dart';
import 'package:sertifikasi_mobile/view/control_view.dart';
import 'package:sertifikasi_mobile/view/loginview.dart';
import 'package:sertifikasi_mobile/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../services/local_storage.dart';

class AuthViewController extends GetxController {
  String? email, password, name, username, notelp;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User>? _user = Rxn<User>();

  String? get user => _user?.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user?.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void signInWithEmailAndPassword(BuildContext context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) {
        FireStoreUser().getUserFromFirestore(value.user!.uid).then((doc) {
          saveUserLocal(
              UserModel.fromJson(doc.data() as Map<dynamic, dynamic>));
        });
      });
      AlertDialog alert = AlertDialog(
        title: Text("Login Berhasil"),
        content: Container(
          child: Text("Selamat Datang Anda Berhasil login"),
        ),
        actions: [
          TextButton(
            child: Text('Ok'),
            onPressed: () => Get.offAll(() => ControlView()),
          ),
        ],
      );

      showDialog(context: context, builder: (context) => alert);
      return;
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login.. sing in',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void registerWithEmailAndPassword(BuildContext context) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        await FireStoreUser().addUserToFireStore(UserModel(
          userId: user.user!.uid,
          email: user.user!.email!,
          name: name!,
          pic: '',
          username: username!,
          notelp: notelp!,
        ));
        saveUserLocal(UserModel(
          userId: user.user!.uid,
          email: user.user!.email!,
          name: name!,
          pic: '',
          username: username!,
          notelp: notelp!,
        ));
      });
       AlertDialog alert = AlertDialog(
        title: Text("Registrasi Berhasil"),
        content: Container(
          child: Text("Selamat Anda Berhasil Registrasi Silahkan Login"),
        ),
        actions: [
          TextButton(
            child: Text('Ok'),
            onPressed: () =>  Get.to(() => LoginView()),
          ),
        ],
      );

      showDialog(context: context, builder: (context) => alert);
      return;
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login..regis',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      LocalStorageUser.clearUserData();
    } catch (error) {
      print(error);
    }
  }

  void saveUserLocal(UserModel userModel) async {
    LocalStorageUser.setUserData(userModel);
  }
}

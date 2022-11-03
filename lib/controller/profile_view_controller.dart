import 'package:sertifikasi_mobile/view/welcomeview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../services/flutter_user.dart';
import '../services/local_storage.dart';
import '../../model/user_model.dart';

class ProfileViewController extends GetxController {
  UserModel? _currentUser;
  String? name, email, password, picUrl, username, notelp;

  UserModel? get currentUser => _currentUser;

  bool _loading = false;

  bool get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  getTest() async {
    await FireStoreUser()
        .getUserFromFirestore('jWQxveYQy1VWUgfuVCYDJgX2Aso2')
        .then((doc) {
      print(doc.data() as Map<dynamic, dynamic>);
      saveUserLocal(UserModel.fromJson(doc.data() as Map<dynamic, dynamic>));
    });
  }

  getCurrentUser() async {
    _loading = true;
    _currentUser = await LocalStorageUser.getUserData();
    _loading = false;
    update();
  }

  updateCurrentUser() async {
    try {
      UserModel _userModel = UserModel(
        userId: _currentUser!.userId,
        email: email!,
        name: name!,
        pic: picUrl == null ? _currentUser!.pic : picUrl!,
        username: username!,
        notelp: notelp!,
      );
      await FirebaseAuth.instance.currentUser!.updateEmail(email!);
      await FirebaseAuth.instance.currentUser!.updatePassword(password!);
      FireStoreUser().addUserToFireStore(_userModel);
      await LocalStorageUser.setUserData(_userModel);
      getCurrentUser();
      Get.back();
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to update..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  // final LocalStorageUser localStorageUser = Get.find();

  void signOut() async {
    try {
      await _auth.signOut();
      LocalStorageUser.clearUserData();
      Get.to(() => WelcomeView());
    } catch (error) {
      print(error);
    }
  }

  void saveUserLocal(UserModel userModel) async {
    await LocalStorageUser.setUserData(userModel);
  }
}

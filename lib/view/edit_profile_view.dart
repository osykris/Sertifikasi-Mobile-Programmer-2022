import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/selectImgae_controller.dart';
import '../controller/profile_view_controller.dart';
import './widget/custom_text.dart';
import './widget/custom_buttom.dart';
import './widget/text_form_field.dart';

class EditProfileView extends StatefulWidget {
  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    String _loginMethod =
        FirebaseAuth.instance.currentUser!.providerData[0].providerId;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Edit Profil',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: GetBuilder<SelectImageViewModel>(
          init: SelectImageViewModel(),
          builder: (controller) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 24.h),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 60.h,
                              backgroundImage: AssetImage('assets/profil.png'),
                              foregroundImage: controller.imageFile != null
                                  ? FileImage(controller.imageFile!)
                                  : null,
                            ),
                            SizedBox(
                              width: 40.w,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.dialog(
                                  AlertDialog(
                                    title: CustomText(
                                      text: 'Choose option',
                                      fontSize: 20,
                                      color: Colors.blue,
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Divider(
                                          height: 1.h,
                                        ),
                                        ListTile(
                                          onTap: () async {
                                            try {
                                              await controller.cameraImage();
                                              Get.back();
                                            } catch (error) {
                                              Get.back();
                                            }
                                          },
                                          title: CustomText(
                                            text: 'Camera',
                                          ),
                                          leading: Icon(
                                            Icons.camera,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        Divider(
                                          height: 1.h,
                                        ),
                                        ListTile(
                                          onTap: () async {
                                            try {
                                              await controller.galleryImage();
                                              Get.back();
                                            } catch (error) {
                                              Get.back();
                                            }
                                          },
                                          title: CustomText(
                                            text: 'Gallery',
                                          ),
                                          leading: Icon(
                                            Icons.account_box,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: Text('Select Image'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextFormField(
                          title: 'Name',
                          hintText: Get.find<ProfileViewController>()
                              .currentUser!
                              .name,
                          initialValue: Get.find<ProfileViewController>()
                              .currentUser!
                              .name,
                          validatorFn: (value) {
                            if (value!.isEmpty || value.length < 4)
                              return 'Please enter valid name.';
                          },
                          onSavedFn: (value) {
                            Get.find<ProfileViewController>().name = value;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextFormField(
                          title: 'Username',
                          hintText: Get.find<ProfileViewController>()
                              .currentUser!
                              .username,
                          initialValue: Get.find<ProfileViewController>()
                              .currentUser!
                              .username,
                          validatorFn: (value) {
                            if (value!.isEmpty || value.length < 4)
                              return 'Please enter valid username.';
                          },
                          onSavedFn: (value) {
                            Get.find<ProfileViewController>().username = value;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextFormField(
                          title: 'Nomor Telepon',
                          hintText: Get.find<ProfileViewController>()
                              .currentUser!
                              .notelp,
                          initialValue: Get.find<ProfileViewController>()
                              .currentUser!
                              .notelp,
                            keyboardType: TextInputType.number,
                          validatorFn: (value) {
                            if (value!.isEmpty || value.length < 4)
                              return 'Please enter valid nomor Telepon.';
                          },
                          onSavedFn: (value) {
                            Get.find<ProfileViewController>().notelp = value;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Column(
                          children: [
                            CustomTextFormField(
                              title: 'Email',
                              hintText: Get.find<ProfileViewController>()
                                  .currentUser!
                                  .email,
                              initialValue: Get.find<ProfileViewController>()
                                  .currentUser!
                                  .email,
                              keyboardType: TextInputType.emailAddress,
                              validatorFn: (value) {
                                if (value!.isEmpty)
                                  return 'Please enter valid email address.';
                              },
                              onSavedFn: (value) {
                                Get.find<ProfileViewController>().email = value;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextFormField(
                              title: 'Password',
                              hintText: '',
                              obscureText: true,
                              validatorFn: (value) {
                                if (value!.isEmpty || value.length < 6)
                                  return 'Please enter valid password with at least 6 characters.';
                              },
                              onSavedFn: (value) {
                                Get.find<ProfileViewController>().password =
                                    value;
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        _isLoading
                            ? CircularProgressIndicator()
                            : CustomButton(
                                'SUBMIT',
                                () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    try {
                                      await controller.uploadImageToFirebase();
                                      Get.find<ProfileViewController>().picUrl =
                                          controller.picUrl;
                                    } catch (e) {
                                      Get.find<ProfileViewController>().picUrl =
                                          Get.find<ProfileViewController>()
                                              .currentUser!
                                              .pic;
                                    }
                                    _formKey.currentState!.save();
                                    await Get.find<ProfileViewController>()
                                        .updateCurrentUser();
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  }
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

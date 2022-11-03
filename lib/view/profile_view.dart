import 'dart:ffi';

import 'package:sertifikasi_mobile/controller/auth_view_controller.dart';
import 'package:sertifikasi_mobile/view/edit_profile_view.dart';
import 'package:sertifikasi_mobile/view/welcomeview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/profile_view_controller.dart';
import './widget/custom_text.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewController>(
      init: ProfileViewController(),
      builder: (controller) => controller.loading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: Padding(
              padding: EdgeInsets.only(top: 16.h, right: 16.w, left: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color:  Color(0xff38B0A9),
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '${controller.currentUser!.pic}'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Column(
                            children: [
                              CustomText(
                                text: controller.currentUser!.name,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color:  Color(0xff38B0A9),
                              ),
                              SizedBox(
                                height: 13.h,
                              ),
                              CustomText(
                                text: controller.currentUser!.email,
                                fontSize: 14,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    ListTile(
                      leading: Image.asset('assets/icons/1.png'),
                      title: CustomText(
                        text: "Edit Profile",
                      ),
                      onTap: () {
                        Get.to(() => EditProfileView());
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ListTile(
                      leading: Image.asset('assets/icons/2.png'),
                      title: CustomText(
                        text: "Log Out",
                      ),
                      onTap: () {
                        controller.signOut();
                        Get.to(() => WelcomeView());
                      },
                    ),
                  ],
                ),
              ),
            )),
    );
  }
}

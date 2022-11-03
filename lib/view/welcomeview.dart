import 'package:sertifikasi_mobile/controller/auth_view_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sertifikasi_mobile/view/loginview.dart';
import 'package:sertifikasi_mobile/view/register_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'widget/custom_text.dart';

class WelcomeView extends GetWidget<AuthViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 320.w,
              height: 320.h,
              child: Image.asset(
                "assets/ilus.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomText(
              text: "Sertifikasi Mobile",
              fontSize: 35,
              alignment: Alignment.center,
              fontWeight: FontWeight.w500,
              color: Color(0xff38B0A9),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomText(
              text: "Talent Scouting Academy (TSA) KOMINFO",
              alignment: Alignment.center,
              fontSize: 12,
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: Get.width * 0.5,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => RegisterView());
                },
                child: const Text("Daftar Akun"),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: const Color(0xff38B0A9),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: Get.width * 0.5,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => LoginView());
                },
                child: const Text(
                  "Masuk",
                  style: TextStyle(
                    color: Color(0xff38B0A9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side:
                          const BorderSide(width: 2, color: Color(0xff38B0A9)),
                    )),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Text(
              "TSA by Osy @2022",
              style: TextStyle(
                color: Color(0xff38B0A9),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:sertifikasi_mobile/view/loginview.dart';
import 'package:sertifikasi_mobile/view/welcomeview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './widget/custom_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              height: 15.h,
            ),
            const Text(
              'Selamat Datang Di Sertifikasi Mobile Semoga Lolos!',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff38B0A9)
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

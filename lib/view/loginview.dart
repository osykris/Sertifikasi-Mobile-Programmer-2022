import 'package:sertifikasi_mobile/view/register_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controller/auth_view_controller.dart';

import './widget/text_form_field.dart';
import './widget/custom_buttom.dart';
import './widget/custom_text.dart';

class LoginView extends GetWidget<AuthViewController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Login Page',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(30.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomText(
                  text: "Silahkan Login",
                  fontSize: 32,
                  color: Color(0xff38B0A9),
                  alignment: Alignment.center,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomText(
                  text: "Silahkan login ke akun yang sudah ada",
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomTextFormField(
                  title: 'Email',
                  hintText: 'osykris@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  validatorFn: (value) {
                    if (value!.isEmpty) return 'Email invalid or not found';
                  },
                  onSavedFn: (value) {
                    controller.email = value;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextFormField(
                  title: 'Password',
                  hintText: '***********',
                  obscureText: true,
                  validatorFn: (value) {
                    if (value!.isEmpty) return 'Password is incorrect';
                  },
                  onSavedFn: (value) {
                    controller.password = value;
                  },
                ),
                SizedBox(
                  height: 100.h,
                ),
                CustomButton(
                  'SIGN IN',
                  () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      controller.signInWithEmailAndPassword(context);
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
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
        ));
  }
}

import 'package:sertifikasi_mobile/view/loginview.dart';
import 'package:sertifikasi_mobile/view/welcomeview.dart';
import 'package:sertifikasi_mobile/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../controller/auth_view_controller.dart';

import '../view/widget/custom_buttom.dart';
import '../view/widget/text_form_field.dart';

class RegisterView extends GetWidget<AuthViewController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Daftar Akun',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Get.off(() => WelcomeView());
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(30.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  title: 'Nama',
                  hintText: 'Osy Krisdayanti',
                  validatorFn: (value) {
                    if (value!.isEmpty) return 'Nama invalid or not found';
                  },
                  onSavedFn: (value) {
                    controller.name = value;
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  title: 'Username',
                  hintText: 'osykris',
                  validatorFn: (value) {
                    if (value!.isEmpty) return 'Username invalid or not found';
                  },
                  onSavedFn: (value) {
                    controller.username = value;
                  },
                ),
                SizedBox(
                  height: 10.h,
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
                  height: 10.h,
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
                  height: 10.h,
                ),
                CustomTextFormField(
                  title: 'Nomor Telepon',
                  hintText: '082234678112',
                 keyboardType: TextInputType.number,
                  validatorFn: (value) {
                    if (value!.isEmpty) return 'Username invalid or not found';
                  },
                  onSavedFn: (value) {
                    controller.notelp = value;
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomButton(
                  'REGISTER',
                  () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      controller.registerWithEmailAndPassword(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

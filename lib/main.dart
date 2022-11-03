import 'package:sertifikasi_mobile/bindings/binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'view/control_view.dart';
import 'bindings/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => ScreenUtilInit(
        designSize: orientation == Orientation.portrait
            ? const Size(360, 690)
            : const Size(690, 360),
        builder: (BuildContext, child) => GetMaterialApp(
          initialBinding: Binding(),
          home: ControlView(),
          debugShowCheckedModeBanner: false,
          title: 'Sertifikasi Mobile',
        ),
      ),
    );
  }
}

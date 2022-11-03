import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/scan_qr_controller.dart';

class ScanqrView extends GetView<ScanqrController> {
  final scanqrC = Get.put(ScanqrController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
                                primary: Color(0xff38B0A9),
                              ),
        onPressed: () {
          scanqrC.scanQR();
        },
        child: const Text("Scan qr"),
      ),
    );
  }
}

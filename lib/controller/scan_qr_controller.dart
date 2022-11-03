import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class ScanqrController extends GetxController {
  //TODO: Implement ScanqrController

  String scannedQrcode = "";

  @override
  void onClose() {}

  Future<void> scanQR() async {
    try {
      scannedQrcode = await FlutterBarcodeScanner.scanBarcode(
        "#ff666666",
        'cancel',
        true,
        ScanMode.QR,
      );
      if (scannedQrcode != "-1") {
        Get.snackbar("Result", "QR code " + scannedQrcode,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      }
    } on PlatformException {}
  }
}

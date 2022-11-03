import 'package:sertifikasi_mobile/services/local_storage.dart';
import 'package:get/get.dart';

import '../controller/control_view_controller.dart';
import '../controller/auth_view_controller.dart';
import '../controller/maps_view_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewController());
    Get.lazyPut(() => ControlViewCont());
    Get.lazyPut(() => MapsViewController());
    Get.lazyPut(() => LocalStorageUser());
  }
}

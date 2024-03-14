import 'package:get/get.dart';

import 'routine_controller.dart';

class DashBoardBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardController());
  }

}
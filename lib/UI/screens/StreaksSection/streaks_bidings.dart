import 'package:get/get.dart';
import 'package:skincaredemo/UI/screens/StreaksSection/streaks_controller.dart';

class IntakeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StreaksController());
  }
}

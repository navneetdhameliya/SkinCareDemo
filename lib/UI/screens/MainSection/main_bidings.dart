import 'package:get/get.dart';
import 'package:skincaredemo/UI/screens/MainSection/main_controller.dart';


class MainBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }

}
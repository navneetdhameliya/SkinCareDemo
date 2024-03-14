import 'package:get/get.dart';
import 'package:skincaredemo/infrastructure/commons/constants/storage_constants.dart';
import 'package:skincaredemo/infrastructure/shared/shared_preference_service.dart';

class StreaksController extends GetxController {
  RxInt streaks = 0.obs;

  @override
  void onInit() {
    super.onInit();
    SharedPreferenceService.getIntValue(StorageConstants.streak).then((value) {
      if (value != null) {
        streaks.value = value;
        update();
      }
    });
  }
}

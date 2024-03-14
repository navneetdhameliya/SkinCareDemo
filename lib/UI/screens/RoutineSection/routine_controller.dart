import 'dart:convert';

import 'package:get/get.dart';
import 'package:skincaredemo/infrastructure/models/responses/skin_Care_model.dart';
import 'package:skincaredemo/infrastructure/shared/shared_preference_service.dart';

class RoutineController extends GetxController {
  RxList<SkinCareDataModel> skinCarData = [
    SkinCareDataModel(
        title: 'Cleanser',
        subTitle: 'Cetaphil Gentle Skin Cleanser',
        completed: false,
        time: DateTime.now()),
    SkinCareDataModel(
        title: 'Toner',
        subTitle: 'Thayers Witch Hazel Toner',
        completed: false,
        time: DateTime.now()),
    SkinCareDataModel(
        title: 'Moisturizer',
        subTitle: 'Kiehl\'s Ultra Facial Cream',
        completed: false,
        time: DateTime.now()),
    SkinCareDataModel(
        title: 'Sunscreen',
        subTitle: 'Supergoop Unseen Sunscreen SPF 40',
        completed: false,
        time: DateTime.now()),
    SkinCareDataModel(
        title: 'Lip Balm',
        subTitle: 'Glossier Birthday Balm Dotcom',
        completed: false,
        time: DateTime.now()),
  ].obs;
  @override
  void onInit() {
    super.onInit();
    SharedPreferenceService.getStringValue('routineData').then((value) {
      if(value!=null) {
        List data = jsonDecode(value);
        skinCarData.value = data.map((e) => SkinCareDataModel.fromJson(e)).toList();
        update();
      }
    });

  }
}

import 'package:get/get.dart';
import 'package:skincaredemo/infrastructure/models/responses/skin_Care_model.dart';

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
}

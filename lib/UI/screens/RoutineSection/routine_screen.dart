import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:skincaredemo/UI/common_widgets/common_inkwell_button.dart';
import 'package:skincaredemo/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:skincaredemo/UI/screens/StreaksSection/streaks_controller.dart';
import 'package:skincaredemo/infrastructure/commons/constants/app_constants.dart';
import 'package:skincaredemo/infrastructure/commons/constants/color_constants.dart';
import 'package:skincaredemo/infrastructure/commons/constants/get_mediaquery.dart';
import 'package:skincaredemo/infrastructure/commons/constants/image_constants.dart';
import 'package:skincaredemo/infrastructure/commons/constants/storage_constants.dart';
import 'package:skincaredemo/infrastructure/commons/constants/toast.dart';
import 'package:skincaredemo/infrastructure/models/responses/skin_Care_model.dart';
import 'package:skincaredemo/infrastructure/shared/shared_preference_service.dart';

import 'routine_controller.dart';

class RoutineScreen extends GetView<RoutineController> {
  const RoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoutineController>(
        init: RoutineController(),
        builder: (RoutineController controller) {
          return Scaffold(
            backgroundColor: ColorConstants.primaryColor,
            appBar: AppBar(
              backgroundColor: ColorConstants.primaryColor,
              title: GestureDetector(
                onTap: () async {
                  // SharedPreferenceService.clearPreference();
                },
                child: HeadlineBodyOneBaseWidget(
                  title: AppConstants.dailySkinCare,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            body: SizedBox(
              width: displayWidth(context),
              height: displayHeight(context),
              child: Column(
                children: List.generate(
                  controller.skinCarData.length,
                  (index) => buildDataTile(
                    onTap: () async {
                      if (controller.skinCarData[index].image.isEmpty) {
                        final ImagePicker picker = ImagePicker();
                        final XFile? img = await picker.pickImage(
                          source: ImageSource.camera,
                          maxWidth: 400,
                        );
                        if (img == null) return;

                        var imgFile = File(img.path);

                        FirebaseStorage storage = FirebaseStorage.instance;

                        Reference reference = storage.ref().child("images/");

                        reference
                            .child("image$index.jpg")
                            .putFile(imgFile)
                            .then((p0) async {
                          controller.skinCarData[index].image = await storage
                              .ref()
                              .child("images/")
                              .child('image$index.jpg')
                              .getDownloadURL();
                          controller.update();
                        });

                        controller.skinCarData[index].completed =
                            !controller.skinCarData[index].completed;
                        controller.skinCarData[index].time = DateTime.now();
                        controller.update();
                      }

                      if (!controller.skinCarData
                          .any((element) => element.completed == false)) {
                        DateTime? time = (await SharedPreferenceService
                                    .getStringValue(
                                        StorageConstants.lastStreak) !=
                                null
                            ? DateTime.parse(
                                await SharedPreferenceService.getStringValue(
                                        StorageConstants.lastStreak) ??
                                    "")
                            : null);
                        var now = DateTime.now();
                        if (time == null) {
                          int streak =
                              (await SharedPreferenceService.getIntValue(
                                          StorageConstants.streak) ??
                                      0) +
                                  1;

                          await SharedPreferenceService.saveIntValue(
                              StorageConstants.streak, streak);
                          await SharedPreferenceService.saveStringValue(
                              StorageConstants.lastStreak,
                              DateTime.now().toString());
                          Get.put(StreaksController());
                          Get.find<StreaksController>().streaks.value = streak;
                          Get.find<StreaksController>().update();
                          showTopToast(msg: AppConstants.streakAdded);
                        } else if (time.year != now.year &&
                            time.month != now.month &&
                            time.day != now.day) {
                          int streak =
                              (await SharedPreferenceService.getIntValue(StorageConstants.streak) ?? 0) + 1;

                          await SharedPreferenceService.saveIntValue(
                              StorageConstants.streak, streak);
                          await SharedPreferenceService.saveStringValue(
                              StorageConstants.lastStreak,
                              DateTime.now().toString());
                          Get.find<StreaksController>().streaks.value = streak;
                          Get.find<StreaksController>().update();
                          for (var element in controller.skinCarData) {
                            element.completed = false;
                          }

                          var data = jsonEncode(controller.skinCarData.map((element) => element.toJson()).toList());
                          SharedPreferenceService.saveStringValue(StorageConstants.routineData, data);


                          showTopToast(msg: AppConstants.streakAdded);
                        } else {
                          showTopToast(msg: AppConstants.streakAlreadyAdded);
                        }
                      }
                      controller.update();
                    },
                    data: controller.skinCarData[index],
                  ),
                ),
              ).paddingSymmetric(horizontal: 20),
            ),
          );
        });
  }

  Widget buildDataTile({
    required SkinCareDataModel data,
    GestureTapCallback? onTap,
  }) {
    return commonInkWell(
      onTap: onTap,
      child: SizedBox(
        height: 72,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 48,
              width: 48,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorConstants.secondaryColor,
              ),
              alignment: Alignment.center,
              child: data.completed ? const Icon(Icons.check_rounded) : null,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadlineBodyOneBaseWidget(
                    title: data.title,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  Flexible(
                    child: HeadlineBodyOneBaseWidget(
                      title: data.subTitle,
                      fontSize: 14,
                      titleColor: ColorConstants.textColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            data.image.isEmpty
                ? commonInkWell(
                    child: Image.asset(
                    ImageConstants.camera,
                    width: 24,
                    height: 24,
                  ))
                : SizedBox(
                    height: 32, width: 32, child: Image.network(data.image)),
            const SizedBox(
              width: 4,
            ),
            HeadlineBodyOneBaseWidget(
              title: data.completed ? DateFormat.jm().format(data.time!) : '',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              titleColor: ColorConstants.textColor,
            ),
          ],
        ).paddingSymmetric(vertical: 6),
      ),
    );
  }
}

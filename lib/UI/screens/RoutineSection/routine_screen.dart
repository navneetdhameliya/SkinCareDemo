import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skincaredemo/UI/common_widgets/common_inkwell_button.dart';
import 'package:skincaredemo/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:skincaredemo/infrastructure/commons/constants/color_constants.dart';
import 'package:skincaredemo/infrastructure/commons/constants/get_mediaquery.dart';
import 'package:skincaredemo/infrastructure/commons/constants/image_constants.dart';

import 'routine_controller.dart';

class RoutineScreen extends GetView<DashBoardController> {
  const RoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
        init: DashBoardController(),
        builder: (DashBoardController controller) {
      return Scaffold(
        backgroundColor: ColorConstants.primaryColor,
        appBar: AppBar(
          backgroundColor: ColorConstants.primaryColor,
          title: const HeadlineBodyOneBaseWidget(
            title: 'Daily Skincare',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          width: displayWidth(context),
          height: displayHeight(context),
          child: Column(
            children: [
              buildDataTile(title: 'Cleanser',subTitle: 'Cetaphil Gentle Skin Cleanser'),
              buildDataTile(title: 'Toner',subTitle: 'Thayers Witch Hazel Toner'),
              buildDataTile(title: 'Moisturizer',subTitle: 'Kiehl\'s Ultra Facial Cream'),
              buildDataTile(title: 'Sunscreen',subTitle: 'Supergoop Unseen Sunscreen SPF 40'),
              buildDataTile(title: 'Lip Balm',subTitle: 'Glossier Birthday Balm Dotcom'),
            ],
          ).paddingSymmetric(horizontal: 20),
        ),
      );
    });
  }

  Widget buildDataTile({
    required String title,
    required String subTitle,
}) {
    return SizedBox(
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
            child: const Icon(Icons.check_rounded),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadlineBodyOneBaseWidget(
                  title: title,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                Flexible(
                  child: HeadlineBodyOneBaseWidget(
                    title: subTitle,
                    fontSize: 14,
                    titleColor: ColorConstants.textColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4,),
          commonInkWell(child: Image.asset(ImageConstants.camera,width: 24,height: 24,)),
          const SizedBox(width: 4,),
          HeadlineBodyOneBaseWidget(
            title: DateFormat.jm().format(DateTime.now()),
            fontSize: 16,
            fontWeight: FontWeight.w500,
            titleColor: ColorConstants.textColor,
          ),
        ],
      ).paddingSymmetric(vertical: 6),
    );
  }
}

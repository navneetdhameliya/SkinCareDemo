import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skincaredemo/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:skincaredemo/infrastructure/package/snackbar/custom_snackbar.dart';

showTopToast({required dynamic msg,BuildContext ?context}){

    if(msg is String) {
        Get.closeAllSnackbars();

        return showCustomSnackbar(
            "",
            "",
            duration: const Duration(seconds: 2),
            margin: const EdgeInsets.all(16.0),
            animationDuration: const Duration(milliseconds: 100),
            boxShadows: [
                BoxShadow(
                    color: Colors.black.withOpacity(.5),
                    blurRadius: 10,
                )
            ],
            messageText: HeadlineBodyOneBaseWidget(
                title: msg,
                fontSize: 12,
                titleColor: Colors.black,
                maxLine: 2,
                titleTextAlign: TextAlign.center,
            ),
        );
    }
}

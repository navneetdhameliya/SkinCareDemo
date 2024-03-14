import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';

SnackbarController showCustomSnackbar(
    String title,
    String message, {
      Color? colorText,
      Duration? duration = const Duration(seconds: 3),

      bool instantInit = true,
      SnackPosition? snackPosition,
      Widget? titleText,
      Widget? messageText,
      Widget? icon,
      bool? shouldIconPulse,
      double? maxWidth,
      EdgeInsets? margin,
      EdgeInsets? padding,
      double? borderRadius,
      Color? borderColor,
      double? borderWidth,
      Color? backgroundColor,
      Color? leftBarIndicatorColor,
      List<BoxShadow>? boxShadows,
      Gradient? backgroundGradient,
      TextButton? mainButton,
      OnTap? onTap,
      bool? isDismissible,
      bool? showProgressIndicator,
      DismissDirection? dismissDirection,
      AnimationController? progressIndicatorController,
      Color? progressIndicatorBackgroundColor,
      Animation<Color>? progressIndicatorValueColor,
      SnackStyle? snackStyle,
      Curve? forwardAnimationCurve,
      Curve? reverseAnimationCurve,
      Duration? animationDuration,
      double? barBlur,
      double? overlayBlur,
      SnackbarStatusCallback? snackbarStatus,
      Color? overlayColor,
      Form? userInputForm,
    }) {
  final getSnackBar = GetSnackBar(
      snackbarStatus: snackbarStatus,
      messageText: messageText ??
          Text(
            message,
            style: TextStyle(
              color: colorText ?? Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
      snackPosition: snackPosition ?? SnackPosition.TOP,
      borderRadius: borderRadius ?? 15,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 10),
      duration: duration,
      barBlur: barBlur ?? 7.0,
      backgroundColor: backgroundColor ?? Colors.grey.withOpacity(0.2),
      icon: icon,
      shouldIconPulse: shouldIconPulse ?? true,
      maxWidth: maxWidth,
      padding: padding ?? const EdgeInsets.all(16),
      borderColor: borderColor ?? Colors.white,
      borderWidth: borderWidth ?? 1.0,
      leftBarIndicatorColor: leftBarIndicatorColor,
      boxShadows: boxShadows,
      backgroundGradient: backgroundGradient,
      mainButton: mainButton,
      onTap: onTap,
      isDismissible: isDismissible ?? true,
      dismissDirection: dismissDirection,
      showProgressIndicator: showProgressIndicator ?? false,
      progressIndicatorController: progressIndicatorController,
      progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
      progressIndicatorValueColor: progressIndicatorValueColor,
      snackStyle: snackStyle ?? SnackStyle.FLOATING,
      forwardAnimationCurve: forwardAnimationCurve ?? Curves.easeOutCirc,
      reverseAnimationCurve: reverseAnimationCurve ?? Curves.easeOutCirc,
      animationDuration: animationDuration ?? const Duration(seconds: 1),
      overlayBlur: overlayBlur ?? 0.0,
      overlayColor: overlayColor ?? Colors.transparent,
      userInputForm: userInputForm);

  final controller = SnackbarController(getSnackBar);

  if (instantInit) {
    controller.show();
  } else {
    ambiguate(SchedulerBinding.instance)?.addPostFrameCallback((_) {
      controller.show();
    });
  }
  return controller;
}
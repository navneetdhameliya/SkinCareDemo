import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainController extends GetxController {

  RxInt currentPage = 0.obs;
  final PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
  }
  animateToPage(int page, {withAnimation = false}) {
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: withAnimation ? 250 : 1),
      curve: Curves.easeIn,
    );
  }
}

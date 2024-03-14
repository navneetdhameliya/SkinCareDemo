import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skincaredemo/UI/screens/MainSection/Widgets/bottom_navigation_bar.dart';
import 'package:skincaredemo/UI/screens/MainSection/main_controller.dart';
import 'package:skincaredemo/UI/screens/RoutineSection/routine_screen.dart';
import 'package:skincaredemo/UI/screens/StreaksSection/streaks_screen.dart';
import 'package:skincaredemo/infrastructure/commons/constants/color_constants.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (MainController controller) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: ColorConstants.primaryColor,
        ),
        body: SafeArea(
          child: Obx(()=>Stack(
            children:[
              PageView(
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (value) => controller.currentPage.value = value,
                controller: controller.pageController,
                children: const [
                  RoutineScreenWrapper(),
                  StreaksScreenWrapper(),
                ],
              ).paddingOnly(bottom: 72),
              BottomNavigationBarWidget(
                active: controller.currentPage.value,
                routineTap: () {
                  controller.animateToPage(0);
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                streaksTap: () {
                    controller.animateToPage(4);
                },
              ),
            ],
          ),),
        ),
      );
    });
  }

  commonIconWidget({required int currentIndex, required int selectedIndex, required String iconData}) {
    return Container(
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8)),
      child: SvgPicture.asset(iconData,),
    );
  }
}

class RoutineScreenWrapper extends StatefulWidget {
  const RoutineScreenWrapper({
    super.key,
  });

  @override
  State<RoutineScreenWrapper> createState() => _RoutineScreenWrapperState();
}

class _RoutineScreenWrapperState extends State<RoutineScreenWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  const RoutineScreen();
  }
}

class StreaksScreenWrapper extends StatefulWidget {
  const StreaksScreenWrapper({
    super.key,
  });

  @override
  State<StreaksScreenWrapper> createState() => _StreaksScreenWrapperState();
}

class _StreaksScreenWrapperState extends State<StreaksScreenWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const StreaksScreen();
  }
}


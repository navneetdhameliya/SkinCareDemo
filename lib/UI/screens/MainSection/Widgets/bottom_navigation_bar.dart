import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skincaredemo/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:skincaredemo/infrastructure/commons/constants/color_constants.dart';
import 'package:skincaredemo/infrastructure/commons/constants/image_constants.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.active,
    this.routineTap,
    this.streaksTap,
  });

  final GestureTapCallback? routineTap;
  final GestureTapCallback? streaksTap;
  final int active;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: width,
        height: 75,
        decoration: const BoxDecoration(
          color: ColorConstants.primaryColor,
          border: Border(top: BorderSide(color: ColorConstants.secondaryColor,))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: routineTap,
              child: Container(
                alignment: Alignment.center,
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImageConstants.search,
                      colorFilter: const ColorFilter.mode( ColorConstants.textColor,
                          BlendMode.srcIn),
                    ),
                    const HeadlineBodyOneBaseWidget(
                      title: 'Routine',
                      fontSize: 12,
                      titleColor: ColorConstants.textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 32,),
            InkWell(
              onTap: streaksTap,
              child: Container(
                alignment: Alignment.center,
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImageConstants.people,
                      colorFilter: const ColorFilter.mode(ColorConstants.textColor,
                          BlendMode.srcIn),
                    ),
                    const HeadlineBodyOneBaseWidget(
                      title: "Streaks",
                      fontSize: 12,
                      titleColor: ColorConstants.textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skincaredemo/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.title,
    this.titleColor,
    this.buttonColor,
    required this.onTap,
    this.loader,
    this.borderColor,  this.icon,
  });

  final String title;
  final String? icon;
  final Color? titleColor;
  final Color? borderColor;
  final Color? buttonColor;
  final bool? loader;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent, width: 1.5),
          color:  buttonColor ?? Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: loader ?? false
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(icon!=null)
                ...[SvgPicture.asset(icon!),
                  const SizedBox(width: 8),],
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: HeadlineBodyOneBaseWidget(
                        title: title,
                        titleColor: titleColor!,
                        fontSize: 16,
                        maxLine: 1,
                      ),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}

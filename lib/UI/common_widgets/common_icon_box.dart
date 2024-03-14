import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonIconBox extends StatelessWidget {
  const CommonIconBox({super.key,required this.icon});
final String icon;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black,width: 1.5)
      ),
      child: SvgPicture.asset(icon),
    );
  }
}

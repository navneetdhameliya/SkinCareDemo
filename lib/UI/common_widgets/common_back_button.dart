import 'package:flutter/material.dart';

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle),
        child: const Padding(
          padding: EdgeInsets.only(
              right: 5,
              left: 3,
              top: 5,bottom: 5),

          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 19,
          ),
        ));
  }
}

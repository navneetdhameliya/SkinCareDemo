import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {

  final GestureTapCallback? onTap;
  final Widget child;

  const CustomInkWell({super.key, this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: child,

    );
  }
}


Widget commonInkWell( { required Widget child,GestureTapCallback? onTap,BorderRadius ?borderRadius}){
  return InkWell(
    onTap: onTap,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    focusColor: Colors.transparent,
    borderRadius: borderRadius,
    child: child,

  );
}
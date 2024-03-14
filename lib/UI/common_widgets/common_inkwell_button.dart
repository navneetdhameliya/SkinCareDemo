import 'package:flutter/material.dart';

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
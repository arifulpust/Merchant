import '../Constant/constant.dart';
import 'package:flutter/material.dart';

BoxDecoration lineBoxDecoration(bool isEnabaled) {
  return (isEnabaled
      ? BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: field_box_active_color,
            width: 1,
          ))
      : BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(
            color: field_box_diactive_color,
            width: 1,
          )));
}

BoxDecoration rectangleBox() {
  return BoxDecoration(
      color: languageBGColor, borderRadius: BorderRadius.circular(24));
}

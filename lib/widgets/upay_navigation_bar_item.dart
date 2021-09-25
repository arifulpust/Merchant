import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

class UpayBottomNavigationBarItem extends StatelessWidget {
  final String activeIcon;
  final String inactiveIcon;
  final String title;
  const UpayBottomNavigationBarItem(
      {Key? key,
      required this.activeIcon,
      required this.inactiveIcon,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

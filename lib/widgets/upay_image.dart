import 'package:Merchant/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpayImage extends StatelessWidget {
  final VoidCallback press;
  final double height;
  final double width;
  final String path;

  const UpayImage(
      {Key? key,
      this.height = 16,
      this.width = 16,
      required this.path,
      required this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: ClipOval(
        child: Image.asset(
          path,
          fit: BoxFit.cover,
          width: width.w,
          height: height.h,
        ),
      ),
    );
  }
}

class UpayCircularImage extends StatelessWidget {
  final VoidCallback press;
  final double height;
  final double width;
  final String path;
  final double border;

  const UpayCircularImage(
      {Key? key,
      this.height = 50,
      this.width = 50,
      this.border = 0,
      required this.path,
      required this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(shape: BoxShape.circle, color: gray_4),
        child: Padding(
          padding: EdgeInsets.all(border),
          child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            padding: EdgeInsets.all(3),
            child: ClipOval(
              child: Image.asset(
                path,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

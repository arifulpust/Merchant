import 'package:Merchant/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpayButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final double textSize;
  final double redius;
  final bool isBold;
  final double height;
  final double width;
  final Color bgColor;
  final Color textColor;
  const UpayButton(
      {Key? key,
      required this.text,
      this.textColor = Colors.black,
      this.bgColor = lightPrimary,
      this.redius = 12,
      this.height = 50,
      this.textSize = 16.0,
      this.width = double.infinity,
      this.isBold = false,
      required this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      child: ElevatedButton(
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: textSize.sp,
            fontFamily: 'SFProText',
            fontWeight: isBold ? FontWeight.w800 : FontWeight.w400,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: bgColor,
          fixedSize: const Size.fromWidth(double.maxFinite),
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(redius)),
        ),
      ),
    );
  }
}

class UpayNumber extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final double textSize;
  final double redius;
  final bool isBold;
  final double height;
  final double width;
  final Color bgColor;
  final Color textColor;
  const UpayNumber(
      {Key? key,
      required this.text,
      required this.textSize,
      this.textColor = Colors.black,
      this.bgColor = lightPrimary,
      this.redius = 12,
      this.height = 50,
      this.width = double.infinity,
      this.isBold = false,
      required this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: textSize,
            fontFamily: 'SFProText',
            fontWeight: isBold ? FontWeight.w800 : FontWeight.w400,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0.3,
          primary: bgColor,
          fixedSize: const Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(redius)),
        ),
      ),
    );
  }
}

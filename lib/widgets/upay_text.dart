import 'package:Merchant/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpayText extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final double textSize;
  final double redius;
  final bool isBold;
  final double height;
  final double padding;
  final double width;
  final Color bgColor;
  final Color textColor;
  final Alignment alignment;
  const UpayText(
      {Key? key,
      required this.text,
      required this.textSize,
      this.isBold = false,
      this.redius = 0.0,
      this.padding = 6.0,
      this.bgColor = Colors.transparent,
      this.textColor = Colors.black,
      this.height = 50.0,
      this.width = double.infinity,
      this.alignment = Alignment.center,
      required this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: width.w,
        height: height.h,
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(redius),
          color: bgColor,
        ),
        child: Align(
          alignment: alignment,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: textSize.sp,
              fontFamily: 'SFProText',
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/utilities/upay_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'upay_image.dart';
import 'upay_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UpayMoreCard extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback press;
  final double textSize;
  final double redius;
  final double height;
  final double imgHeight;
  final double width;
  final double imgWidth;
  final Color bgColor;
  final Color textColor;
  final bool isRightArrow;
  const UpayMoreCard(
      {Key? key,
      required this.text,
      required this.icon,
      required this.press,
      this.textSize = 20,
      this.redius = 10,
      this.height = 160,
      this.isRightArrow = true,
      required this.imgHeight,
      required this.imgWidth,
      this.width = 180,
      required this.bgColor,
      this.textColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      color: bgColor,
      child: InkWell(
        onTap: press,
        splashColor: gray,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: getWidth(context, 13),
                child: Image.asset(
                  icon,
                  width: imgWidth.w,
                  height: imgHeight.h,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                width: (getWidth(context, 76) +
                    (isRightArrow ? 0 : getWidth(context, 10))),
                child: UpayText(
                  width: width,
                  alignment: Alignment.centerLeft,
                  text: text,
                  textSize: textSize,
                  press: () {
                    print("clicked");
                  },
                  isBold: false,
                  textColor: textColor,
                ),
              ),
              Visibility(
                visible: isRightArrow,
                child: Container(
                  width: getWidth(context, 10),
                  child: Image.asset(
                    RIGHT_ARROW,
                    width: 32.w,
                    height: 32.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/utilities/upay_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'upay_image.dart';
import 'upay_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UpayCard extends StatelessWidget {
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
  final bool isBold;
  const UpayCard(
      {Key? key,
      required this.text,
      required this.icon,
      required this.press,
      this.textSize = 18,
      this.isBold = false,
      this.redius = 10,
      this.height = 160,
      required this.imgHeight,
      required this.imgWidth,
      this.width = 180,
      required this.bgColor,
      this.textColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: bgColor, width: 1),
        borderRadius: BorderRadius.circular(redius),
      ),
      child: Container(
        width: width.w,
        height: height.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: height / 2,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    icon,
                    width: imgWidth.w,
                    height: imgHeight.h,
                  ),
                ),
              ),
              Container(
                height: height / 2,
                padding: EdgeInsets.only(top: 6),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: UpayText(
                    text: text,
                    height: height / 2,
                    alignment: Alignment.topCenter,
                    textSize: textSize,
                    press: () {
                      print("clicked");
                    },
                    isBold: isBold,
                    textColor: textColor,
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

import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/utilities/upay_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'upay_image.dart';
import 'upay_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UpayAddMoneyCard extends StatelessWidget {
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
  const UpayAddMoneyCard(
      {Key? key,
      required this.text,
      required this.icon,
      required this.press,
      this.textSize = 20,
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
        padding: EdgeInsets.all(10),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(
                  icon,
                  width: imgWidth,
                  height: imgHeight,
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              UpayText(
                width: 110,
                alignment: Alignment.centerLeft,
                text: text,
                textSize: textSize,
                press: () {
                  print("clicked");
                },
                isBold: false,
                textColor: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

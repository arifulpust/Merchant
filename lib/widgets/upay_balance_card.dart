import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/utilities/upay_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'upay_image.dart';
import 'upay_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UpayBalanceCard extends StatelessWidget {
  final String title;
  final String balance;
  final String icon;
  final VoidCallback press;
  final double textSize;
  final double redius;
  final double height;
  final double width;
  final Color bgColor;
  final Color textColor;
  const UpayBalanceCard(
      {Key? key,
      required this.title,
      required this.balance,
      required this.icon,
      required this.press,
      this.textSize = 20,
      this.redius = 12,
      this.height = 120,
      this.width = 167,
      required this.bgColor,
      this.textColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(icon), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: redius,
            offset: Offset(0, .5), // Shadow position
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            UpayText(
              width: double.infinity,
              text: title,
              textSize: 15,
              press: () {
                print("clicked");
              },
              isBold: true,
              textColor: blue_1,
            ),
            UpayText(
              width: double.infinity,
              text: balance + "/-",
              textSize: 22,
              press: () {
                print("clicked");
              },
              isBold: true,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

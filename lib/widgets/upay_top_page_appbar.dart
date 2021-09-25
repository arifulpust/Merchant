import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/utilities/upay_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'upay_image.dart';
import 'upay_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UpayTopPageAppbar extends StatelessWidget with PreferredSizeWidget {
  final String text;
  final Function() press;
  final Color bgColor;
  final Color textColor;
  final bool isQRCode;
  final double height;

  const UpayTopPageAppbar(
      {Key? key,
      required this.text,
      this.height = 120,
      this.isQRCode = false,
      this.bgColor = lightPrimary,
      this.textColor = Colors.black,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height.h,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: bgColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  offset: Offset(0, 2),
                  blurRadius: 5.0,
                  spreadRadius: 0)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: getWidth(context, 80),
              padding: EdgeInsets.only(bottom: 5.h, left: 12.w),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 34.sp,
                    fontFamily: 'SFProText',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isQRCode,
              child: Container(
                width: getWidth(context, 15),
                height: double.infinity,
                margin: EdgeInsets.only(right: 16.w, bottom: 16.h),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    QR_CODE,
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

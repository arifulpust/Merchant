import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/utilities/upay_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'upay_image.dart';
import 'upay_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpayUserInfo extends StatelessWidget {
  final String icon;
  final String name;
  final String wallete;
  final String balance;
  final Color bgColor;
  final double height;

  const UpayUserInfo(
      {Key? key,
      required this.icon,
      this.height = 90,
      required this.name,
      required this.wallete,
      required this.balance,
      required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: getWidth(context, 15),
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              // margin: EdgeInsets.only(bottom: 16.h, left: 12.w),
              child: Align(
                alignment: Alignment.center,
                child: UpayCircularImage(
                  path: icon,
                  height: 50,
                  width: 50,
                  border: 2,
                  press: () {},
                ),
              ),
            ),
            Container(
              width: getWidth(context, 55),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    wallete,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: gray_7,
                      fontSize: 12.sp,
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                ],
              ),
            ),
            Container(
              width: getWidth(context, 20),
              padding: EdgeInsets.only(right: 12.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    local!.balance,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: gray_7,
                      fontSize: 12.sp,
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    '12,000',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

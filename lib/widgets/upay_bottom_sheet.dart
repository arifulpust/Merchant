import 'package:Merchant/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'upay_buttons.dart';

class UpayBottomSheet extends StatelessWidget {
  final String tilte;
  final String message;
  final String buttonText;
  final double height;
  final VoidCallback confirm;
  final VoidCallback close;
  const UpayBottomSheet(
      {Key? key,
      required this.tilte,
      required this.message,
      required this.buttonText,
      required this.close,
      this.height = 250.0,
      required this.confirm})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16.0),
                topRight: const Radius.circular(16.0))),
        child: Stack(children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: gray,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16.0),
                      topRight: const Radius.circular(16.0))),
              child: Column(
                children: [
                  SizedBox(height: 6.h),
                  Image.asset(
                    RECTANGLE,
                    height: 4.h,
                    width: 32.w,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(tilte,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontFamily: 'SFProText',
                                fontWeight: FontWeight.w800)),
                      ),
                      GestureDetector(
                        onTap: close,
                        child: Image.asset(
                          CLOSE,
                          width: 30.w,
                          height: 30.h,
                        ),
                      ),
                      SizedBox(width: 10.w),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Center(
              child: Text(message,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'SFProText',
                  ),
                  textAlign: TextAlign.center),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              child: UpayButton(
                text: buttonText,
                textSize: 16.0,
                press: confirm,
                isBold: true,
              ),
            ),
          )
        ]),
      ),
    );
  }
}

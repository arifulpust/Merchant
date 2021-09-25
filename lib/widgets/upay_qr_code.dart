import '../Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpayQRCode extends StatelessWidget {
  final VoidCallback press;
  final double height;
  final double width;

  const UpayQRCode(
      {Key? key, required this.press, this.height = 44, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press,
      child: Center(
        child: Container(
            height: height.h,
            width: width.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: orange_10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 10.w,
                ),
                Image.asset(
                  QR_CODE,
                  fit: BoxFit.cover,
                  width: 30.w,
                  height: 30.h,
                ),
                SizedBox(
                  width: 16.w,
                ),
                Text(
                  'My QR Code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'SFProText',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

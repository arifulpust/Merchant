import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/utilities/upay_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'upay_image.dart';

class UpayHomeAppbar extends StatelessWidget {
  final Function(Status) press;
  final Color bgColor;
  final Status status;

  const UpayHomeAppbar(
      {Key? key,
      this.bgColor = lightPrimary,
      this.status = Status.none,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.h,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: getWidth(context, 15),
              // margin: EdgeInsets.only(bottom: 16.h, left: 12.w),
              padding: EdgeInsets.only(bottom: 16.h, left: 12.w),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: UpayImage(
                  path: ICON_UPAY,
                  height: 40,
                  width: 40,
                  press: () {},
                ),
              ),
            ),
            Container(
              width: getWidth(context, 60),
              padding: EdgeInsets.only(bottom: 3.h, left: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Agora Super Shop ',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    '01751191579',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11.sp,
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
              height: double.infinity,
              margin: EdgeInsets.only(right: 16.w, bottom: 16.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 34.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      color: blue_1,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Visibility(
                          visible: status == Status.none ? true : false,
                          child: GestureDetector(
                            onTap: () => press(Status.showing),
                            child: Text(
                              'Balance',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontFamily: 'SFProText',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: status == Status.loading ? true : false,
                          child: Text(
                            'loading',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontFamily: 'SFProText',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: status == Status.showing ? true : false,
                          child: Text(
                            '৳',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontFamily: 'SFProText',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: status == Status.showing ? true : false,
                          child: SizedBox(
                            width: 10.w,
                          ),
                        ),
                        Visibility(
                          visible: status == Status.showing ? true : false,
                          child: Text(
                            '1,100',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontFamily: 'SFProText',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ));
  }
  //
  // @override
  // Size get preferredSize => const Size.fromHeight(80);
}

import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/features/notification/model/notification_data.dart';
import 'package:Merchant/utilities/upay_enum.dart';
import 'package:Merchant/widgets/upay_buttons.dart';
import 'package:Merchant/widgets/upay_text.dart';
import 'package:Merchant/widgets/upay_top_page_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final NotificationData item;
  final VoidCallback press;

  const NotificationItem({Key? key, required this.item, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 65.h,
        margin: EdgeInsets.only(bottom: 5),
        child: Row(
          children: <Widget>[
            Container(
              width: 60,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                item.icon,
                width: 40,
                height: 40,
              ),
            ),
            Container(
              width: (getWidth(context, 100) - 60) / 2,
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    item.subTitle,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    item.transactionId,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: blue,
                      fontSize: 12.sp,
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: (getWidth(context, 100) - 60) / 2,
              padding: EdgeInsets.only(left: 4, right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    item.amount + "/-",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Charge ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: gray_11,
                            fontSize: 12.sp,
                            fontFamily: 'SFProText',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          item.charge + "/-",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: error_color,
                            fontSize: 12.sp,
                            fontFamily: 'SFProText',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    item.dateTime,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: gray_11,
                      fontSize: 12.sp,
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/utilities/upay_enum.dart';
import 'package:Merchant/widgets/upay_card.dart';
import 'package:Merchant/widgets/upay_home_appbar.dart';
import 'package:Merchant/widgets/upay_qr_code.dart';
import 'package:Merchant/widgets/upay_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Status status = Status.none;

  void changeStatus() {
    status = Status.none;
    setState(() {});
  }

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, changeStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        UpayHomeAppbar(
          status: status,
          press: (value) {
            status = value;
            print(status.toString() + "-----");
            if (status == Status.showing) {
              startTime();
            }
            setState(() {});
          },
        ),
        SizedBox(
          height: 12.h,
        ),
        UpayQRCode(
          width: getWidth(context, 60),
          press: () {},
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UpayCard(
              icon: M2M,
              text: ' M2M Payment',
              press: () {},
              imgHeight: 60.h,
              bgColor: orange_11,
              imgWidth: 58.w,
            ),
            UpayCard(
              icon: CASH_IN,
              text: ' Customer Cash In',
              press: () {},
              imgHeight: 60.h,
              bgColor: green_5,
              imgWidth: 32.w,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UpayCard(
              icon: SETTLEMENT,
              text: 'Settlement',
              press: () {},
              imgHeight: 50.h,
              bgColor: orange_30,
              imgWidth: 44.w,
            ),
            UpayCard(
              icon: BILL_PAYMENT,
              text: 'Bill Payment',
              press: () {},
              imgHeight: 60.h,
              bgColor: orange_20,
              imgWidth: 34.w,
            )
          ],
        ),
      ]),
    );
  }
}

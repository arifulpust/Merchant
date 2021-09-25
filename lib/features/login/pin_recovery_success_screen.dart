import 'dart:async';

import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/widgets/upay_bottom_sheet.dart';
import 'package:Merchant/widgets/upay_buttons.dart';
import 'package:Merchant/widgets/upay_phone_input_fields.dart';
import 'package:Merchant/widgets/upay_pin_fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utilities/utilities.dart';
import 'package:permission_handler/permission_handler.dart';
import 'otp_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinRecoverySuccessScreen extends StatefulWidget {
  static const routeName = '/login/PinRecoverySuccessScreen';

  @override
  PinRecoverySuccessScreenState createState() =>
      new PinRecoverySuccessScreenState();
}

class PinRecoverySuccessScreenState extends State<PinRecoverySuccessScreen> {
  var _visible = true;
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    // Navigator.of(context).pushNamed(OTPScreen.routeName);
    Navigator.of(context).pushReplacementNamed(OTPScreen.routeName);
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));
    var local = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Center(
              child: Container(
                height: getHeight(context, 80),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.h),
                    Container(
                      color: Colors.white,
                      child: Image.asset(
                        SUCCESSFUL,
                        width: 70.w,
                        height: 70.h,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(local!.pin_change_successfully,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontFamily: 'SFProText',
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

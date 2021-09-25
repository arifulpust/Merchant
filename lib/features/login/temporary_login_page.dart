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

import 'pin_recovery_screen.dart';

class TemporaryLoginScreen extends StatefulWidget {
  static const routeName = '/TemporaryLoginScreen';

  @override
  TemporaryLoginScreenState createState() => new TemporaryLoginScreenState();
}

class TemporaryLoginScreenState extends State<TemporaryLoginScreen> {
  final _accountNumberFocusNode = FocusNode();
  final _temporaryPinFocusNode = FocusNode();
  String accountErrorMessage = "";
  String pinErrorMessage = "";
  String accountNumber = "";
  String pin = "";
  bool isAccountValid = false;
  bool isPinValid = false;

  void navigationPage() {
    Navigator.of(context).pushNamed(PinRecoveryScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    _accountNumberFocusNode.addListener(() {
      if (_accountNumberFocusNode.hasFocus) {
        accountErrorMessage = "";
      }
      setState(() {});
    });
    _temporaryPinFocusNode.addListener(() {
      if (_temporaryPinFocusNode.hasFocus) {
        pinErrorMessage = "";
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _accountNumberFocusNode.dispose();
    _temporaryPinFocusNode.dispose();
    super.dispose();
  }

  Future<void> showBottomSheet(BuildContext context) async {
    var local = AppLocalizations.of(context);

    if (!isPhoneNumberValid(accountNumber)) {
      accountErrorMessage = local!.pleaseEnterYourAccountNumber;
      setState(() {});
    } else if (!isPinNumberValid(pin)) {
      print(pin + "---");
      isPinValid = false;
      pinErrorMessage = local!.pleaseEnterYourCorrectTemporaryPIN;
      setState(() {});
    } else {
      if (await Permission.sms.request().isGranted) {
        // Either the permission was already granted before or the user just granted it.
        showModalBottomSheet(
            context: context,
            isDismissible: false,
            enableDrag: false,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(16.0),
                topRight: const Radius.circular(16.0),
              ),
            ),
            builder: (BuildContext context) {
              return UpayBottomSheet(
                  tilte: local!.deviceAuthorisation,
                  message: local.deviceAuthorisationMessage,
                  buttonText: local.confirmDevice,
                  close: () {
                    Navigator.pop(context);
                  },
                  confirm: () {
                    Navigator.pop(context);
                    navigationPage();
                    //
                  });
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));
    var local = AppLocalizations.of(context);
    print(getHeight(context, 100).toString());
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListView(
                children: <Widget>[
                  Container(
                    height: getHeight(context, 80),
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 30.h),
                        Container(
                          color: Colors.white,
                          child: Image.asset(
                            UPAY_ICON,
                            width: 65.w,
                            height: 89.h,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Text(local!.loginToYourAccount,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 34.sp,
                                fontFamily: 'SFProText',
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center),
                        SizedBox(height: 40.h),
                        UpayPhoneInputField(
                            title: local.accountNumber,
                            hintText: local.hint_phone_number,
                            error: accountErrorMessage,
                            inputFocusNode: _accountNumberFocusNode,
                            isValid: isAccountValid,
                            onChanged: (value) {
                              accountNumber = value;
                              isAccountValid = isPhoneNumberValid(value);
                              accountErrorMessage = "";
                              setState(() {});
                            },
                            press: () {
                              if (!isPhoneNumberValid(accountNumber)) {
                                accountErrorMessage =
                                    local.pleaseEnterYourAccountNumber;
                                setState(() {});
                              } else {
                                FocusScope.of(context)
                                    .requestFocus(_temporaryPinFocusNode);
                              }
                            }),
                        SizedBox(height: 10.h),
                        UpayPinField(
                            title: local.temporaryPIN,
                            hintText: local.hint_pin,
                            error: pinErrorMessage,
                            inputFocusNode: _temporaryPinFocusNode,
                            onChanged: (value) {
                              pin = value;
                              isPinValid = isPinNumberValid(pin);
                              pinErrorMessage = "";
                              setState(() {});
                            },
                            isValid: isPinValid,
                            press: () {
                              showBottomSheet(context);
                            }),
                      ],
                    ),
                  ),
                  UpayButton(
                    text: local!.login,
                    textSize: 16.0,
                    isBold: true,
                    press: () {
                      showBottomSheet(context);
                    },
                  ),
                  SizedBox(height: getHeight(context, 2)),
                ],
              ),
            )),
      ),
    );
  }
}

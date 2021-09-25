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

import 'pin_recovery_success_screen.dart';

class PinRecoveryScreen extends StatefulWidget {
  static const routeName = '/login/PinRecoveryScreen';

  @override
  PinRecoveryScreenState createState() => new PinRecoveryScreenState();
}

class PinRecoveryScreenState extends State<PinRecoveryScreen> {
  final _accountNumberFocusNode = FocusNode();
  final _temporaryPinFocusNode = FocusNode();
  final _newPinFocusNode = FocusNode();
  final _confirmPinFocusNode = FocusNode();
  String accountErrorMessage = "";
  String tempPinErrorMessage = "";
  String newPinErrorMessage = "";
  String confirmPinErrorMessage = "";
  String accountNumber = "";
  String pin = "";
  String newPin = "";
  String confirmPin = "";
  bool isAccountValid = false;
  bool isPinValid = false;
  bool isNewPinValid = false;
  bool isConfirmPinValid = false;

  void navigationPage() {
    Navigator.of(context).pushNamed(PinRecoverySuccessScreen.routeName);
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
        tempPinErrorMessage = "";
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
                        Text(local!.set_four_digit_pin,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 34.sp,
                                fontFamily: 'SFProText',
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center),
                        SizedBox(height: 40.h),
                        UpayPinField(
                            title: local.temporaryPIN,
                            hintText: local.hint_pin,
                            error: tempPinErrorMessage,
                            inputFocusNode: _temporaryPinFocusNode,
                            onChanged: (value) {
                              pin = value;
                              isPinValid = isPinNumberValid(pin);
                              tempPinErrorMessage = "";

                              setState(() {});
                            },
                            isValid: isPinValid,
                            press: () {
                              if (!isPinNumberValid(pin)) {
                                tempPinErrorMessage =
                                    local.pleaseEnterYourCorrectTemporaryPIN;
                              } else {
                                FocusScope.of(context)
                                    .requestFocus(_newPinFocusNode);
                              }
                              setState(() {});
                            }),
                        SizedBox(height: 5.h),
                        UpayPinField(
                            title: local.new_pin,
                            hintText: local.hint_pin,
                            error: newPinErrorMessage,
                            inputFocusNode: _newPinFocusNode,
                            onChanged: (value) {
                              newPin = value;
                              isNewPinValid = isPinNumberValid(newPin);
                              newPinErrorMessage = "";

                              setState(() {});
                            },
                            isValid: isNewPinValid,
                            press: () {
                              if (!isPinNumberValid(newPin)) {
                                newPinErrorMessage =
                                    local.please_enter_correct_pin;
                              } else {
                                FocusScope.of(context)
                                    .requestFocus(_confirmPinFocusNode);
                              }
                              setState(() {});
                            }),
                        UpayPinField(
                            title: local.confirm_pin,
                            hintText: local.hint_pin,
                            error: confirmPinErrorMessage,
                            inputFocusNode: _confirmPinFocusNode,
                            onChanged: (value) {
                              confirmPin = value;
                              isConfirmPinValid = isPinNumberValid(confirmPin);
                              confirmPinErrorMessage = "";
                              setState(() {});
                            },
                            isValid: isConfirmPinValid,
                            press: () {
                              if (!isPinNumberValid(pin)) {
                                tempPinErrorMessage =
                                    local.pleaseEnterYourCorrectTemporaryPIN;
                              } else if (!isPinNumberValid(newPin)) {
                                newPinErrorMessage =
                                    local.please_enter_correct_pin;
                              } else if (!isPinNumberValid(confirmPin) &&
                                  newPin != confirmPin) {
                                confirmPinErrorMessage =
                                    local.please_enter_correct_pin;
                              } else {
                                navigationPage();
                              }
                              setState(() {});
                            }),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  UpayButton(
                    text: local.set_pin,
                    textSize: 16.0,
                    isBold: true,
                    press: () {
                      if (!isPinNumberValid(pin)) {
                        tempPinErrorMessage =
                            local.pleaseEnterYourCorrectTemporaryPIN;
                      } else if (!isPinNumberValid(newPin)) {
                        newPinErrorMessage = local.please_enter_correct_pin;
                      } else if (!isPinNumberValid(confirmPin) &&
                          newPin != confirmPin) {
                        confirmPinErrorMessage = local.please_enter_correct_pin;
                      } else {
                        navigationPage();
                      }
                      setState(() {});
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

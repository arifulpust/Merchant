import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/data/local_data.dart';
import 'package:Merchant/providers/local_provider.dart';
import 'package:Merchant/widgets/upay_appbar.dart';
import 'package:Merchant/widgets/upay_buttons.dart';
import 'package:Merchant/widgets/upay_phone_input_fields.dart';
import 'package:Merchant/widgets/upay_pin_fields.dart';
import 'package:Merchant/widgets/upay_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utilities/utilities.dart';
import 'pin_login_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _accountNumberFocusNode = FocusNode();
  final _temporaryPinFocusNode = FocusNode();
  String accountErrorMessage = "";
  String pinErrorMessage = "";
  String accountNumber = "";
  String pin = "";
  String language = "";
  bool isAccountValid = false;
  bool isPinValid = false;

  void navigationPage() {
    Navigator.of(context).pushNamed(PinLoginScreen.routeName);
  }

  Future<void> _chnageLanguage(ScopedReader watch) async {
    var isBangla = watch(sharedUtilityProvider);
    var changeLanguage = watch(languageChangeProvider);
    if (isBangla.isBanglaEnabled()) {
      isBangla.setBanglaEnabled(false);
      changeLanguage.setLocale(Locale(EN, ''));
    } else {
      isBangla.setBanglaEnabled(true);
      changeLanguage.setLocale(Locale(BN, ''));
    }

    setState(() {});
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

  void showBottomSheet(BuildContext context) {
    var local = AppLocalizations.of(context);
    if (!isPhoneNumberValid(accountNumber)) {
      accountErrorMessage = local!.pleaseEnterYourAccountNumber;
      setState(() {});
    } else if (!isPinNumberValid(pin)) {
      isPinValid = false;
      pinErrorMessage = local!.pleaseEnterYourCorrectTemporaryPIN;
      setState(() {});
    } else {
      navigationPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));
    var local = AppLocalizations.of(context);
    language = local!.language;
    print(language);
    return Consumer(builder: (context, watch, child) {
      // print("code" + lang.countryCode.toString());
      return Scaffold(
        appBar: UpayAppbar(
          text: local!.login,
          language: language,
          isLanguage: true,
          press: () {
            _chnageLanguage(watch);
          },
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 24.h),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          UPAY_ICON,
                          width: 32.w,
                          height: 43.h,
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Text(local.logInToUpayMerchant,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontFamily: 'SFProText',
                                  fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(local!.logInToUpayMerchantMessage,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'SFProText',
                      ),
                      textAlign: TextAlign.center),
                  SizedBox(height: 50.h),
                  UpayPhoneInputField(
                      title: local.mobileNumber,
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
                              local!.pleaseEnterYourAccountNumber;
                          setState(() {});
                        } else {
                          FocusScope.of(context)
                              .requestFocus(_temporaryPinFocusNode);
                        }
                      }),
                  SizedBox(height: 15.h),
                  UpayPinField(
                      title: local.fourDigitPin,
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
                  SizedBox(height: 120.h),
                  UpayButton(
                    text: local.login,
                    textSize: 16.0,
                    isBold: true,
                    press: () {
                      showBottomSheet(context);
                    },
                  ),
                  SizedBox(height: 6),
                  UpayText(
                    text: local.forgotPIN,
                    textSize: 20.0,
                    padding: 0,
                    alignment: Alignment.topCenter,
                    press: () {
                      print("clicked");
                    },
                    textColor: blue,
                    redius: 0,
                  ),
                ],
              ),
            )),
      );
    });
  }
}

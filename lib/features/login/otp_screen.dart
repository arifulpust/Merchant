import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/data/local_data.dart';
import 'package:Merchant/features/login/components/otp_view.dart';
import 'package:Merchant/providers/local_provider.dart';
import 'package:Merchant/features/home/home_page.dart';
import 'package:Merchant/utilities/upay_enum.dart';
import 'package:Merchant/widgets/upay_buttons.dart';

import 'package:Merchant/widgets/upay_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utilities/utilities.dart';
import 'components/pin_view.dart';
import 'components/upay_header.dart';
import 'components/upay_keypad.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_screen.dart';

class OTPScreen extends StatefulWidget {
  static const routeName = '/OTPScreen';

  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String pinErrorMessage = "";
  String pin = "";
  String language = "";
  bool isPinValid = false;
  final _firstOTPFocusNode = FocusNode();
  final _secondOTPFocusNode = FocusNode();
  final _thirdOTPFocusNode = FocusNode();
  final _forthOTPFocusNode = FocusNode();

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
  void didChangeDependencies() {
    setFocs(true);
    super.didChangeDependencies();
  }

  void navigationPage() {
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    // setFocs();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setFocs(bool isAdded) {
    if (pin.length == 0) {
      if (isAdded) FocusScope.of(context).requestFocus(_firstOTPFocusNode);
    } else if (pin.length == 1) {
      if (isAdded) {
        FocusScope.of(context).requestFocus(_secondOTPFocusNode);
      } else {
        FocusScope.of(context).requestFocus(_firstOTPFocusNode);
      }
    } else if (pin.length == 2) {
      if (isAdded) {
        FocusScope.of(context).requestFocus(_thirdOTPFocusNode);
      } else {
        FocusScope.of(context).requestFocus(_secondOTPFocusNode);
      }
    } else if (pin.length == 3) {
      if (isAdded) {
        FocusScope.of(context).requestFocus(_forthOTPFocusNode);
      } else {
        FocusScope.of(context).requestFocus(_thirdOTPFocusNode);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);

    language = local!.language;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Consumer(builder: (context, watch, child) {
      return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 30.h),
                  UpayHeader(
                    language: language,
                    oncChanged: (value) {
                      _chnageLanguage(watch);
                    },
                  ),
                  SizedBox(height: getHeight(context, 10)),
                  UpayText(
                    width: getWidth(context, 80),
                    text: local.oneTimePassword,
                    textSize: 34.0,
                    height: 60,
                    press: () {},
                    isBold: true,
                    textColor: Colors.black,
                  ),
                  SizedBox(height: getHeight(context, 5)),
                  UpayText(
                    height: 70,
                    width: getWidth(context, 80),
                    text: local.oneTimePasswordMessage,
                    textSize: 16.0,
                    press: () {
                      print("clicked");
                    },
                    isBold: false,
                    textColor: Colors.black,
                  ),
                  SizedBox(height: getHeight(context, 10)),
                  OTPView(
                    pin: pin,
                    firstOTPFocusNode: _firstOTPFocusNode,
                    secondOTPFocusNode: _secondOTPFocusNode,
                    thirdOTPFocusNode: _thirdOTPFocusNode,
                    forthOTPFocusNode: _forthOTPFocusNode,
                    isEditable: true,
                    onChanged: (value) {
                      if (value.length == 0) {
                        if (pin.length > 0) {
                          pin = pin.substring(0, pin.length - 1);
                          setFocs(false);
                        }
                      } else if (pin.length < 4) {
                        pin = pin + value;
                        setFocs(true);
                      }
                      print('pin' + "-p-" + pin);
                      if (pin.length == 4) {
                        navigationPage();
                      }
                      //setState(() {});
                    },
                  ),
                  SizedBox(height: getHeight(context, 5)),
                  UpayText(
                    width: getWidth(context, 80),
                    text: local.resendOTPMessage.replaceAll(COUNT, "2"),
                    textSize: 16.0,
                    press: () {
                      print("clicked");
                    },
                    isBold: false,
                    textColor: gray_6,
                  ),
                  SizedBox(height: getHeight(context, 5)),
                  UpayButton(
                    width: 100.w,
                    text: local.resend,
                    textSize: 16.0,
                    isBold: true,
                    press: () {
                      // showBottomSheet(context);
                    },
                  ),
                ],
              ),
            )),
      );
    });
  }
}

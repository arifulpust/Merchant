import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/data/local_data.dart';
import 'package:Merchant/providers/local_provider.dart';
import 'package:Merchant/features/home/home_page.dart';
import 'package:Merchant/utilities/upay_enum.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class PinLoginScreen extends StatefulWidget {
  static const routeName = '/PinLoginScreen';

  const PinLoginScreen({Key? key}) : super(key: key);

  @override
  _PinLoginScreenState createState() => _PinLoginScreenState();
}

class _PinLoginScreenState extends State<PinLoginScreen> {
  String pinErrorMessage = "";
  String pin = "";
  String language = "";
  bool isPinValid = false;
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

  void navigationPage() {
    Navigator.of(context).pushNamed(HomeScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);
    language = local!.language;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Consumer(builder: (context, watch, child) {
      return SafeArea(
        child: Scaffold(
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: getHeight(context, 40),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 30.h),
                          UpayHeader(
                            language: language,
                            oncChanged: (value) {
                              _chnageLanguage(watch);
                            },
                          ),
                          SizedBox(height: 60.h),
                          UpayText(
                            width: getWidth(context, 80),
                            padding: 0,
                            height: 85,
                            text: local.enterYourFourDigitPin,
                            textSize: 34.0,
                            press: () {
                              print("clicked");
                            },
                            isBold: true,
                            textColor: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      height: getHeight(context, 50),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: PinView(
                              pin: pin,
                              error: local.youHaveTwoChancesLeft
                                  .replaceAll(COUNT, "2"),
                              confirm: () {
                                if (pin.length == 4) {
                                  navigationPage();
                                }
                              },
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: UpayKeypad(
                                pin: pin,
                                listener: (status, value) {
                                  if (status == Status.forgot) {
                                  } else if (status == Status.delete) {
                                    if (pin.length > 0) {
                                      pin = pin.substring(0, pin.length - 1);
                                    }
                                    setState(() {});
                                  } else if (status == Status.confirm) {
                                    if (pin.length == 4) {
                                      navigationPage();
                                    }
                                  } else {
                                    if (pin.length < 4) {
                                      pin = pin + value;
                                    }
                                    setState(() {});
                                  }
                                },
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
      );
    });
  }
}

import 'dart:async';

import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/common/models/MenuItem.dart';
import 'package:Merchant/features/login/temporary_login_page.dart';
import 'package:Merchant/providers/local_provider.dart';
import 'package:Merchant/widgets/upay_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = '/IntroScreen';

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushNamed(TemporaryLoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);

    FocusScope.of(context).unfocus();
    print("height:" +
        getHeight(context, 100).toString() +
        "  " +
        getWidth(context, 100).toString());
    return Consumer(builder: (context, watch, child) {
      final List<MenuItem> items = watch(itemsProvider);
      return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: getHeight(context, 25),
                    color: Colors.white,
                    child: Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Image.asset(
                          UPAY_ICON,
                          width: 65,
                          height: 89,
                        )),
                  ),
                  Container(
                    height: getHeight(context, 60),
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(
                                left: 6.0, right: 6.0, top: 6.0),
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  items[index].image,
                                  width: 58,
                                  height: 43,
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Text(items[index].title,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontFamily: 'SFProText',
                                          fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  Container(
                      height: getHeight(context, 15),
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: UpayButton(
                            text: local!.getStarted,
                            isBold: true,
                            textSize: 16.0,
                            press: () {
                              navigationPage();
                            },
                          )))
                ],
              ),
            )),
      );
    });
  }
}

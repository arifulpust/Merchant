import 'dart:async';

import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/features/account/account_screen.dart';
import 'package:Merchant/features/home/dashboard.dart';
import 'package:Merchant/features/more/more_screen.dart';
import 'package:Merchant/features/notification/notification_screen.dart';
import 'package:Merchant/features/report/report_screen.dart';
import 'package:Merchant/utilities/upay_enum.dart';
import 'package:Merchant/widgets/upay_appbar.dart';
import 'package:Merchant/widgets/upay_home_appbar.dart';
import 'package:Merchant/widgets/upay_text.dart';
import 'package:Merchant/widgets/upay_top_page_appbar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/upay_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  Status status = Status.none;
  void navigationPage() {
    // Navigator.of(context).pushReplacementNamed(HOME_SCREEN);
  }
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, changeStatus);
  }

  @override
  void initState() {
    super.initState();
  }

  void changeStatus() {
    status = Status.none;
    setState(() {});
  }

  getWidget() {
    if (_selectedIndex == 0) {
      return Dashboard();
    } else if (_selectedIndex == 1) {
      return AccountScreen();
    } else if (_selectedIndex == 2) {
      return ReportScreen();
    } else if (_selectedIndex == 3) {
      return NotificationScreen();
    } else if (_selectedIndex == 4) {
      return MoreScreen();
    } else {
      return Dashboard();
    }
  }

  getAppBar(BuildContext context) {
    var local = AppLocalizations.of(context);

    if (_selectedIndex == 0) {
      return UpayHomeAppbar(
        status: status,
        press: (value) {
          status = value;
          print(status.toString() + "-----");
          if (status == Status.showing) {
            startTime();
          }
          setState(() {});
        },
      );
    } else {
      return UpayTopPageAppbar(
        text: getTitle(context, _selectedIndex),
        bgColor: Colors.white,
        textColor: blue,
        isQRCode: _selectedIndex == 1 ? true : false,
        press: () {},
      );
    }
  }

  getTitle(BuildContext context, int index) {
    var local = AppLocalizations.of(context);
    if (index == 1)
      return local!.account;
    else if (index == 2)
      return local!.report;
    else if (index == 3)
      return local!.notification;
    else {
      return local!.more;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    // FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    var local = AppLocalizations.of(context);
    return Scaffold(
      // appBar: getAppBar(context),
      bottomNavigationBar: UpayBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTaped: (index) {
          setState(() {
            _selectedIndex = index;
            print(_selectedIndex.toString() + "--");

            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              systemNavigationBarColor:
                  Colors.transparent, // navigation bar color
              statusBarColor: Colors.transparent, // status bar color
            ));
          });
        },
      ),
      body: getWidget(),
    );
  }
}

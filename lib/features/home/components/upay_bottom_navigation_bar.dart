import 'package:Merchant/Constant/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpayBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  final Function(int) onTaped;

  const UpayBottomNavigationBar(
      {Key? key, required this.onTaped, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        fontFamily: 'SFProText',
        fontWeight: FontWeight.w400,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        fontFamily: 'SFProText',
        fontWeight: FontWeight.w400,
      ),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(HOME_DEACTIVE, width: 20.w, height: 20.h),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              HOME,
              width: 20.w,
              height: 20.h,
            ),
          ),
          label: local!.home,
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              ACCOUNT_DEACTIVE,
              width: 20.w,
              height: 20.h,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              ACCOUNT,
              width: 20.w,
              height: 20.h,
            ),
          ),
          label: local.account,
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              REPORT_DEACTIVE,
              width: 20.w,
              height: 20.h,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              REPORT,
              width: 20.w,
              height: 20.h,
            ),
          ),
          label: local.report,
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              NOTIFICATION_DEACTIVE,
              width: 20.w,
              height: 20.h,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              NOTIFICATION,
              width: 20.w,
              height: 20.h,
            ),
          ),
          label: local.notification,
        ),
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              MORE,
              width: 20.w,
              height: 20.h,
            ),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              MORE_DEACTIVE,
              width: 20.w,
              height: 20.h,
            ),
          ),
          label: local.more,
        ),
      ],
      currentIndex: currentIndex,
      unselectedItemColor: gray_6,
      selectedItemColor: blue,
      onTap: (value) => onTaped(value),
    );
  }
}

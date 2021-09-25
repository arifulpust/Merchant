import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/utilities/upay_enum.dart';
import 'package:Merchant/widgets/upay_buttons.dart';
import 'package:Merchant/widgets/upay_text.dart';
import 'package:Merchant/widgets/upay_top_page_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/notification_tapbar.dart';
import 'offer_screen.dart';
import 'transaction_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationType selectedScreen = NotificationType.transaction;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedScreen = NotificationType.transaction;
  }

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          UpayTopPageAppbar(
            text: local!.notification,
            bgColor: Colors.white,
            textColor: blue,
            isQRCode: false,
            press: () {},
          ),
          SizedBox(height: getHeight(context, 2)),
          NotificationTapBar(
            status: selectedScreen,
            tapped: (value) {
              selectedScreen = value;
              setState(() {});
            },
          ),
          SizedBox(height: getHeight(context, 1.5)),
          selectedScreen == NotificationType.transaction
              ? TransactionScreen()
              : OffernScreen()
        ],
      ),
    );
  }
}

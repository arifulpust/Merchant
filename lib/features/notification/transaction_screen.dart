import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/common/models/MenuItem.dart';
import 'package:Merchant/features/notification/model/notification_data.dart';
import 'package:Merchant/providers/local_provider.dart';
import 'package:Merchant/widgets/upay_text.dart';
import 'package:Merchant/widgets/upay_top_page_appbar.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/notification_item.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);

    return Consumer(builder: (context, watch, child) {
      final List<NotificationData> items = watch(notificationsProvider);
      return Container(
        height: getHeight(context, 69),
        color: Colors.white,
        child: ListView.builder(
            itemCount: items.length,
            padding: EdgeInsets.all(0.0),
            itemBuilder: (BuildContext context, int index) {
              return NotificationItem(
                item: items[index],
                press: () {},
              );
            }),
      );
    });
  }
}

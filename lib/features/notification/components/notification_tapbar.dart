import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/utilities/upay_enum.dart';
import 'package:Merchant/widgets/upay_buttons.dart';
import 'package:Merchant/widgets/upay_text.dart';
import 'package:Merchant/widgets/upay_top_page_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationTapBar extends StatelessWidget {
  final NotificationType status;
  final Function(NotificationType) tapped;

  const NotificationTapBar(
      {Key? key, required this.status, required this.tapped})
      : super(key: key);

  getWidget(BuildContext context, String title, NotificationType state) {
    if (status == state) {
      return UpayButton(
        text: title,
        height: 40,
        width: getWidth(context, 45),
        textSize: 13.0,
        bgColor: lightPrimary,
        isBold: true,
        press: () {},
      );
    } else {
      return UpayText(
          text: title,
          textSize: 13.0,
          isBold: true,
          press: () => tapped(state == NotificationType.transaction
              ? NotificationType.transaction
              : NotificationType.offer),
          width: getWidth(context, 45));
    }
  }

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);
    print(status.toString() + "sel");
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 12),
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: gray_12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          getWidget(context, local!.transaction, NotificationType.transaction),
          getWidget(context, local!.offerAndPromossion, NotificationType.offer),
        ],
      ),
    );
  }
}

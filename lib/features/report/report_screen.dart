import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/widgets/upay_text.dart';
import 'package:Merchant/widgets/upay_top_page_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);

    return Container(
      child: Column(
        children: <Widget>[
          UpayTopPageAppbar(
            text: local!.report,
            bgColor: Colors.white,
            textColor: blue,
            isQRCode: false,
            press: () {},
          ),
          Center(child: Text("report")),
        ],
      ),
    );
  }
}

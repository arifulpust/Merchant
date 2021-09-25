import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/providers/local_provider.dart';
import 'package:Merchant/widgets/upay_text.dart';
import 'package:Merchant/widgets/upay_top_page_appbar.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/offer_item.dart';
import 'model/offer_data.dart';

class OffernScreen extends StatelessWidget {
  const OffernScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);

    return Consumer(builder: (context, watch, child) {
      final List<OfferData> items = watch(offersProvider);
      return Container(
        height: getHeight(context, 69),
        margin: EdgeInsets.symmetric(horizontal: 6),
        color: Colors.white,
        child: ListView.builder(
            itemCount: items.length,
            padding: EdgeInsets.all(0.0),
            itemBuilder: (BuildContext context, int index) {
              return OfferItem(
                item: items[index],
                press: () {},
              );
            }),
      );
    });
  }
}

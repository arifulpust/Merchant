import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/widgets/upay_add_money_card.dart';
import 'package:Merchant/widgets/upay_balance_card.dart';
import 'package:Merchant/widgets/upay_card.dart';
import 'package:Merchant/widgets/upay_qr_code.dart';
import 'package:Merchant/widgets/upay_text.dart';
import 'package:Merchant/widgets/upay_top_page_appbar.dart';
import 'package:Merchant/widgets/upay_user_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          UpayTopPageAppbar(
            height: getHeight(context, 15),
            text: local!.account,
            bgColor: Colors.white,
            textColor: blue,
            isQRCode: true,
            press: () {},
          ),
          UpayUserInfo(
            height: getHeight(context, 10),
            icon: AVATER,
            name: "arif",
            wallete: "01751191579",
            bgColor: Colors.white,
            balance: "12,000",
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: double.infinity,
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: UpayText(
                  text: local.sub_wallets,
                  width: double.infinity,
                  textSize: 20,
                  alignment: Alignment.topLeft,
                  isBold: true,
                  press: () {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UpayBalanceCard(
                    icon: PRIMARY,
                    title: local.primary,
                    width: getWidth(context, 46),
                    balance: "12,000",
                    press: () {},
                    bgColor: orange_11,
                  ),
                  UpayBalanceCard(
                    icon: SECONDARY,
                    title: local.secondary,
                    balance: "20,000",
                    press: () {},
                    width: getWidth(context, 46),
                    bgColor: green_5,
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: UpayAddMoneyCard(
                  icon: ADD_MONEY,
                  text: local.add_money,
                  height: 60.h,
                  imgHeight: 30.h,
                  imgWidth: 30.w,
                  textColor: blue,
                  textSize: 16,
                  press: () {},
                  width: double.infinity,
                  bgColor: add_money_color,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: UpayText(
                  text: local.settlement_fees,
                  width: double.infinity,
                  textSize: 20,
                  alignment: Alignment.topLeft,
                  isBold: true,
                  press: () {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UpayCard(
                    icon: BANK,
                    imgWidth: 30,
                    imgHeight: 30,
                    text: local.bank,
                    isBold: true,
                    height: 110,
                    textSize: 15,
                    width: 110,
                    press: () {},
                    bgColor: bank_color,
                  ),
                  UpayCard(
                    icon: AGENT,
                    imgWidth: 30,
                    imgHeight: 30,
                    height: 110,
                    text: local.agent,
                    textSize: 15,
                    isBold: true,
                    press: () {},
                    width: 110,
                    bgColor: agent_color,
                  ),
                  UpayCard(
                    icon: DSO,
                    text: local.dso,
                    imgWidth: 30,
                    height: 110,
                    imgHeight: 30,
                    isBold: true,
                    textSize: 15,
                    press: () {},
                    width: 110,
                    bgColor: dso_color,
                  )
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/utilities/upay_enum.dart';
import 'package:Merchant/widgets/upay_buttons.dart';
import 'package:Merchant/widgets/upay_image.dart';
import 'package:Merchant/widgets/upay_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpayHeader extends StatelessWidget {
  final String language;
  final Function(String) oncChanged;
  const UpayHeader({Key? key, required this.language, required this.oncChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 16.0, right: 12.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              UPAY_ICON,
              width: 32.w,
              height: 43.h,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 80.w,
              child: UpayText(
                text: language,
                textSize: 13.0,
                padding: 0,
                alignment: Alignment.center,
                press: () => oncChanged(language),
                height: 30,
                bgColor: gray_5,
                textColor: blue,
                redius: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}

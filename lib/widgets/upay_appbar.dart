import 'package:Merchant/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'upay_text.dart';

class UpayAppbar extends StatelessWidget with PreferredSizeWidget {
  final String text;
  final String language;
  final VoidCallback press;
  final double textSize;
  final Color bgColor;
  final bool isLanguage;
  final Color textColor;
  const UpayAppbar(
      {Key? key,
      required this.text,
      required this.language,
      this.textSize = 16,
      this.isLanguage = false,
      this.textColor = Colors.black,
      this.bgColor = lightPrimary,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: darkPrimary,
      centerTitle: true,
      backwardsCompatibility: false,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: bgColor),
      title: Text(text,
          style: TextStyle(
              color: Colors.black,
              fontSize: textSize.sp,
              fontFamily: 'SFProText',
              fontWeight: FontWeight.w700),
          textAlign: TextAlign.center),
      actions: <Widget>[
        Visibility(
          visible: isLanguage,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            child: UpayText(
              text: language,
              textSize: 13.0,
              width: 80,
              press: press,
              bgColor: languageBGColor,
              textColor: languageColor,
              height: 30.0,
              redius: 24,
            ),
          ),

          //  Navigator.of(context).pushNamed(EditProductScreen.routeName);
        ),
        SizedBox(width: 10.w)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/utilities/upay_enum.dart';
import 'package:Merchant/widgets/upay_buttons.dart';
import 'package:Merchant/widgets/upay_image.dart';
import 'package:Merchant/widgets/upay_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpayKeypad extends StatelessWidget {
  final Function(Status, String) listener;
  final String pin;

  const UpayKeypad({
    Key? key,
    this.pin = "",
    required this.listener,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);

    return Column(
      children: <Widget>[
        UpayText(
          width: getWidth(context, 60),
          text: local!.forgotPIN,
          textSize: 20.0,
          press: () => listener(Status.forgot, ""),
          bgColor: Colors.white,
          textColor: blue,
          redius: 0,
        ),
        SizedBox(height: 10),
        Container(
          child: Column(children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  UpayNumber(
                    width: getWidth(context, 30),
                    text: "1",
                    textSize: 25.0,
                    press: () => listener(Status.typed, "1"),
                    height: 48,
                    bgColor: gray,
                    textColor: Colors.black,
                    redius: 5,
                  ),
                  UpayNumber(
                    width: getWidth(context, 30),
                    text: "2",
                    textSize: 25.0,
                    press: () => listener(Status.typed, "2"),
                    height: 48,
                    bgColor: gray,
                    textColor: Colors.black,
                    redius: 5,
                  ),
                  UpayNumber(
                    width: getWidth(context, 30),
                    text: "3",
                    textSize: 25.0,
                    press: () => listener(Status.typed, "3"),
                    height: 48,
                    bgColor: gray,
                    textColor: Colors.black,
                    redius: 5,
                  )
                ]),
            SizedBox(height: 8),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  UpayNumber(
                    width: getWidth(context, 30),
                    text: "4",
                    textSize: 25.0,
                    press: () => listener(Status.typed, "4"),
                    height: 48,
                    bgColor: gray,
                    textColor: Colors.black,
                    redius: 5,
                  ),
                  UpayNumber(
                    width: getWidth(context, 30),
                    text: "5",
                    textSize: 25.0,
                    press: () => listener(Status.typed, "5"),
                    height: 48,
                    bgColor: gray,
                    textColor: Colors.black,
                    redius: 5,
                  ),
                  UpayNumber(
                    width: getWidth(context, 30),
                    text: "6",
                    textSize: 25.0,
                    press: () => listener(Status.typed, "6"),
                    height: 48,
                    bgColor: gray,
                    textColor: Colors.black,
                    redius: 5,
                  )
                ]),
            SizedBox(height: 8),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  UpayNumber(
                    width: getWidth(context, 30),
                    text: "7",
                    textSize: 25.0,
                    press: () => listener(Status.typed, "7"),
                    height: 48,
                    bgColor: gray,
                    textColor: Colors.black,
                    redius: 5,
                  ),
                  UpayNumber(
                    width: getWidth(context, 30),
                    text: "8",
                    textSize: 25.0,
                    press: () => listener(Status.typed, "8"),
                    height: 48,
                    bgColor: gray,
                    textColor: Colors.black,
                    redius: 5,
                  ),
                  UpayNumber(
                    width: getWidth(context, 30),
                    text: "9",
                    textSize: 25.0,
                    press: () => listener(Status.typed, "9"),
                    height: 48,
                    bgColor: gray,
                    textColor: Colors.black,
                    redius: 5,
                  )
                ]),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => listener(Status.delete, ""),
                  child: Container(
                    height: 48,
                    width: getWidth(context, 30),
                    child: Image.asset(
                      DELETE,
                      width: 22,
                      height: 18,
                    ),
                  ),
                ),
                UpayNumber(
                  width: getWidth(context, 30),
                  text: "0",
                  textSize: 25.0,
                  press: () => listener(Status.typed, "0"),
                  height: 48,
                  bgColor: gray,
                  textColor: Colors.black,
                  redius: 5,
                ),
                GestureDetector(
                  onTap: () => listener(Status.confirm, ""),
                  child: Container(
                    height: 48,
                    width: getWidth(context, 30),
                    child: Opacity(
                      opacity: pin.length > 3 ? 1 : 0.5,
                      child: Image.asset(
                        OKEY,
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}

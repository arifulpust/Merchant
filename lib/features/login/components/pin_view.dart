import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/widgets/upay_image.dart';
import 'package:Merchant/widgets/upay_text.dart';
import 'package:flutter/material.dart';

class PinView extends StatelessWidget {
  final String pin;
  final String error;
  final VoidCallback confirm;
  const PinView({
    Key? key,
    required this.pin,
    this.error = "",
    required this.confirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 48,
                padding: EdgeInsets.only(
                    top: 8.0, bottom: 8, left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  color: gray,
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    UpayImage(
                      path: pin.length > 0 ? ACTIVE_DOT : INACTIVE_DOT,
                      press: () {},
                    ),
                    SizedBox(width: 24),
                    UpayImage(
                      path: pin.length > 1 ? ACTIVE_DOT : INACTIVE_DOT,
                      press: () {},
                    ),
                    SizedBox(width: 24),
                    UpayImage(
                      path: pin.length > 2 ? ACTIVE_DOT : INACTIVE_DOT,
                      press: () {},
                    ),
                    SizedBox(width: 24),
                    UpayImage(
                      path: pin.length > 3 ? ACTIVE_DOT : INACTIVE_DOT,
                      press: () {},
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
              SizedBox(width: 8),
              UpayImage(
                  path: pin.length > 3 ? ACTIVE_ARROW : INACTIVE_ARROW,
                  press: confirm,
                  width: 35,
                  height: 35),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          UpayText(
            text: error,
            width: getWidth(context, 60),
            textSize: 12,
            press: () {
              print("clicked");
            },
            textColor: error_color,
          ),
        ],
      ),
    );
  }
}

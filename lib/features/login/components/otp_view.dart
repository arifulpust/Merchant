import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/widgets/upay_image.dart';
import 'package:Merchant/widgets/upay_otp_input_fields.dart';
import 'package:Merchant/widgets/upay_text.dart';
import 'package:flutter/material.dart';

class OTPView extends StatelessWidget {
  final String pin;
  final bool isEditable;
  final FocusNode firstOTPFocusNode;
  final FocusNode secondOTPFocusNode;
  final FocusNode thirdOTPFocusNode;
  final FocusNode forthOTPFocusNode;
  final Function(String) onChanged;

  const OTPView({
    Key? key,
    required this.pin,
    required this.firstOTPFocusNode,
    required this.secondOTPFocusNode,
    required this.thirdOTPFocusNode,
    required this.forthOTPFocusNode,
    required this.isEditable,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          UpayOTPInputField(
            text: pin.length > 0 ? pin[0] : "",
            inputFocusNode: firstOTPFocusNode,
            isEnable: isEditable,
            onChanged: (value) => onChanged(value),
          ),
          SizedBox(width: getWidth(context, 3)),
          UpayOTPInputField(
            text: pin.length > 1 ? pin[1] : "",
            inputFocusNode: secondOTPFocusNode,
            isEnable: isEditable,
            onChanged: (value) => onChanged(value),
          ),
          SizedBox(width: getWidth(context, 3)),
          UpayOTPInputField(
            text: pin.length > 2 ? pin[2] : "",
            inputFocusNode: thirdOTPFocusNode,
            isEnable: isEditable,
            onChanged: (value) => onChanged(value),
          ),
          SizedBox(width: getWidth(context, 3)),
          UpayOTPInputField(
            text: pin.length > 3 ? pin[3] : "",
            inputFocusNode: forthOTPFocusNode,
            isEnable: isEditable,
            onChanged: (value) => onChanged(value),
          ),
        ],
      ),
    );
  }
}

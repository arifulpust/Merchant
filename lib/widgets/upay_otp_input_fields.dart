import 'package:Merchant/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpayOTPInputField extends StatelessWidget {
  final FocusNode inputFocusNode;
  final bool isEnable;
  final String text;
  final double width;
  final double height;
  final Function(String) onChanged;

  UpayOTPInputField({
    Key? key,
    required this.inputFocusNode,
    this.isEnable = false,
    required this.onChanged,
    required this.text,
    this.width = 63,
    this.height = 55,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  var local = AppLocalizations.of(context);
    return Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: gray,
        ),
        child: TextFormField(
          autofocus: true,
          initialValue: text,
          enabled: isEnable,
          enableInteractiveSelection: isEnable,
          textInputAction: TextInputAction.next,
          onChanged: (value) => onChanged(value),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22.sp,
            fontFamily: 'SFProText',
          ),
          maxLength: 1,
          focusNode: inputFocusNode,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            counterText: '',
            hintStyle: TextStyle(color: Colors.grey),
            hintText: "",
            border: InputBorder.none,
          ),
        ));

    // SizedBox(width: 5),
  }
}

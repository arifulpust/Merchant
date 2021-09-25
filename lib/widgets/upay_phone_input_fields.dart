import 'package:Merchant/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'upay_style.dart';

class UpayPhoneInputField extends StatelessWidget {
  final String title;
  final String hintText;
  final String error;
  final FocusNode inputFocusNode;
  final bool isValid;
  final VoidCallback press;
  final Function(String) onChanged;

  UpayPhoneInputField(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.error,
      required this.inputFocusNode,
      this.isValid = false,
      required this.onChanged,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  var local = AppLocalizations.of(context);
    return Container(
      margin: EdgeInsets.only(left: 12.0.w, right: 12.0.w),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontFamily: 'SFProText',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 55.h,
            decoration:
                lineBoxDecoration(inputFocusNode.hasFocus ? true : false),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width - 85,
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => onChanged(value),
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18.sp,
                        fontFamily: 'SFProText',
                      ),
                      maxLength: 11,
                      focusNode: inputFocusNode,
                      onFieldSubmitted: (term) => press,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: '',
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: hintText,
                        border: InputBorder.none,
                      ),
                    )),
                GestureDetector(
                  onTap: press,
                  child: Image.asset(
                    isValid ? ARROW_ACTIVE : ARROW_DIACTIVE,
                    width: 30.0.w,
                    height: 30.0.h,
                  ),
                ),
                // SizedBox(width: 5),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            error,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: error_color,
              fontSize: 11,
              fontFamily: 'SFProText',
            ),
          ),
        ],
      ),
    );
  }
}

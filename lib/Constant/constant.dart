import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

String UPAY_ICON = 'assets/images/app_logo.jpg';
String ARROW_ACTIVE = 'assets/images/arrow_active.png';
String ARROW_DIACTIVE = 'assets/images/arrow_diactive.jpg';
String CLOSE = 'assets/images/ic_close.png';
String INACTIVE_ARROW = 'assets/images/ic_inactive_arrow.jpg';
String ACTIVE_ARROW = 'assets/images/ic_active_arrow.jpg';
String ACTIVE_DOT = 'assets/images/ic_active_dot.jpg';
String INACTIVE_DOT = 'assets/images/ic_inactive_dot.png';
String RECTANGLE = 'assets/images/bar.jpg';
String DELETE = 'assets/images/ic_delete.jpg';
String OKEY = 'assets/images/ic_okey.png';
String HOME = 'assets/images/ic_home.png';
String HOME_DEACTIVE = 'assets/images/ic_home_deactive.png';
String ACCOUNT = 'assets/images/ic_account.png';
String ACCOUNT_DEACTIVE = 'assets/images/ic_account_deactive.png';
String REPORT = 'assets/images/ic_report.png';
String REPORT_DEACTIVE = 'assets/images/ic_report_deactive.png';
String MORE = 'assets/images/ic_more.png';
String MORE_DEACTIVE = 'assets/images/ic_more_deactive.png';
String NOTIFICATION = 'assets/images/ic_notification.png';
String NOTIFICATION_DEACTIVE = 'assets/images/ic_notification_deactive.png';
String SUCCESSFUL = 'assets/images/ic_successful.png';
String ICON_UPAY = 'assets/images/icon_upay.png';
String QR_CODE = 'assets/images/ic_qr_code.png';
String M2M = 'assets/images/ic_m2m.png';
String SETTLEMENT = 'assets/images/ic_settlement.png';
String CASH_IN = 'assets/images/ic_cash_in.png';
String BILL_PAYMENT = 'assets/images/ic_bill_payment.png';
String AVATER = 'assets/images/ic_avatar.jpg';
String PRIMARY = 'assets/images/ic_primary.png';
String SECONDARY = 'assets/images/ic_secondary.png';
String ADD_MONEY = 'assets/images/ic_add_money.png';
String BANK = 'assets/images/ic_bank.png';
String AGENT = 'assets/images/ic_agent.png';
String DSO = 'assets/images/ic_dso.png';
String RIGHT_ARROW = 'assets/images/right_arrow.png';
String ICON_LANGUAGE = 'assets/images/ic_language.png';
String ICON_CHANGE_PIN = 'assets/images/ic_pin_change.png';
String ICON_CHANGE_PERMISSION = 'assets/images/ic_change_permission.png';
String ICON_SUPPORT = 'assets/images/ic_support.png';
String ICON_FAQ = 'assets/images/ic_faq.png';
String ICON_HOW_TO_USE = 'assets/images/ic_how_to_use.png';
String ICON_UPDATE_MNO = 'assets/images/ic_mno_update.png';
String ICON_TERM = 'assets/images/ic_terms.png';
String ICON_POLICY = 'assets/images/ic_policy.png';
String ICON_GUIDELINE = 'assets/images/ic_guide.png';
String ICON_LOGOUT = 'assets/images/ic_logout.png';
String ICON_M2M_TRANSFER = 'assets/images/ic_m2m_transfer.png';
String IMG_OFFER = 'assets/images/ic_offer.png';
const double appPadding = 30;
const String english = "en";
const String LANGUAGE = "language";
const String BN = "bn";
const String EN = "en";
const String COUNT = "_count";
const Size defaultSize = Size(384, 837);

const Color lightPrimary = Color.fromRGBO(255, 214, 0, 1.0);
const Color darkPrimary = Color.fromRGBO(255, 214, 0, 1.0);
const Color black = Colors.black;
const Color darkShadow = Color.fromRGBO(222, 160, 0, 1);
const Color lightShadow = Color.fromRGBO(255, 208, 0, 1);
const Color field_box_active_color = Color.fromRGBO(52, 73, 104, 1.0);
const Color field_box_diactive_color = Color.fromRGBO(173, 181, 189, 1.0);
const Color error = Color.fromRGBO(255, 48, 48, 1.0);
const Color error_color = Color.fromRGBO(255, 48, 48, 1.0);
const Color gray = Color.fromRGBO(242, 242, 246, 1.0);
const Color languageBGColor = Color.fromRGBO(0, 109, 204, 0.05);
const Color languageColor = Color.fromRGBO(0, 109, 204, 1.0);
const Color blue = Color.fromRGBO(12, 58, 99, 1.0);
const Color gray_5 = Color.fromRGBO(0, 109, 204, 0.05);
const Color gray_6 = Color.fromRGBO(142, 142, 147, 1.0);
const Color gray_4 = Color.fromRGBO(199, 199, 199, 1.0);
const Color blue_1 = Color.fromRGBO(3, 78, 162, 1.0);
const Color orange_10 = Color.fromRGBO(255, 237, 190, 1.0);
const Color orange_11 = Color.fromRGBO(255, 253, 232, 1.0);
const Color orange_30 = Color.fromRGBO(255, 237, 190, 1);
const Color orange_20 = Color.fromRGBO(241, 249, 212, 1.0);
const Color green_5 = Color.fromRGBO(217, 252, 236, 1.0);
const Color gray_7 = Color.fromRGBO(102, 102, 102, 1.0);
const bank_color = const Color(0xFFFFF1E3);
const agent_color = const Color(0xFFF2F4CE);
const dso_color = const Color(0xFFCDCCE8);
const add_money_color = const Color(0xFFCDCCE8);
const more_color = const Color(0xFFf3f3f3);
const gray_11 = const Color(0xFFAEAEAE);
const gray_12 = const Color(0xD006DCC);
Color more_color_1 = HexColor('#F8F8F8');

double getHeight(BuildContext context, double ratio) {
  double calculatedHeight = MediaQuery.of(context).size.height;
  //- MediaQuery.of(context).padding.top;
  // MediaQuery.of(context).padding.bottom);
  calculatedHeight = ratio * calculatedHeight * .01;
  // print(calculatedHeight.toString());
  return calculatedHeight;
}

double getWidth(BuildContext context, double ratio) {
  double calculatedWidth = ratio * MediaQuery.of(context).size.width * .01;
  // print(calculatedWidth.toString());
  return calculatedWidth;
}

bool isEnglish(String value) {
  if (value != null && value == "bn") {
    return false;
  } else {
    return true;
  }
}

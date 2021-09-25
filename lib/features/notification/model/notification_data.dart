import 'package:flutter/material.dart';

class NotificationData {
  final String icon;
  final String title;
  final String subTitle;
  final String transactionId;
  final String amount;
  final String charge;
  final String dateTime;

  NotificationData(
      @required this.icon,
      @required this.title,
      @required this.subTitle,
      @required this.transactionId,
      @required this.amount,
      @required this.charge,
      @required this.dateTime);
}

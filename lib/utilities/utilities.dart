import 'package:flutter/material.dart';

bool isPhoneNumberValid(String phone) {
  if (phone.length == 11 &&
      (phone.startsWith("019") ||
          phone.startsWith("013") ||
          phone.startsWith("015") ||
          phone.startsWith("016") ||
          phone.startsWith("017") ||
          phone.startsWith("018"))) {
    return true;
  }

  return false;
}

bool isPinNumberValid(String value) {
  if (value.length < 4) {
    return false;
  }
  return true;
}

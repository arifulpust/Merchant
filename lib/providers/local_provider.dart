import 'package:Merchant/Constant/constant.dart';
import 'package:Merchant/common/models/MenuItem.dart';
import 'package:Merchant/features/notification/model/notification_data.dart';
import 'package:Merchant/features/notification/model/offer_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    // if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
}

final languageChangeProvider =
    ChangeNotifierProvider((ref) => LocaleProvider());

final itemsProvider = Provider<List<MenuItem>>((ref) {
  return [
    MenuItem("On demand settelment through countrywide UPAY Agent Point",
        "assets/images/ic_agent_point.jpg"),
    MenuItem(
        "Receive payment, track transaction & income with the fewest clicks",
        "assets/images/ic_transaction.jpg"),
    MenuItem("Robust customer insight and reporting for sales growth",
        "assets/images/ic_sales.jpg")
  ];
});

final notificationsProvider = Provider<List<NotificationData>>((ref) {
  return [
    NotificationData(ICON_M2M_TRANSFER, "M2M Transfer", "01751191579",
        "4324egyedef", "8,000", "80", "26/09/2020, 8:00am"),
    NotificationData(ICON_M2M_TRANSFER, "M2M Transfer", "01751191579",
        "4324egyedef", "8,000", "80", "26/09/2020, 8:00am"),
    NotificationData(ICON_M2M_TRANSFER, "M2M Transfer", "01751191579",
        "4324egyedef", "8,000", "80", "26/09/2020, 8:00am"),
    NotificationData(ICON_M2M_TRANSFER, "M2M Transfer", "01751191579",
        "4324egyedef", "8,000", "80", "26/09/2020, 8:00am"),
    NotificationData(ICON_M2M_TRANSFER, "M2M Transfer", "01751191579",
        "4324egyedef", "8,000", "80", "26/09/2020, 8:00am"),
    NotificationData(ICON_M2M_TRANSFER, "M2M Transfer", "01751191579",
        "4324egyedef", "8,000", "80", "26/09/2020, 8:00am"),
    NotificationData(ICON_M2M_TRANSFER, "M2M Transfer", "01751191579",
        "4324egyedef", "8,000", "80", "26/09/2020, 8:00am"),
  ];
});

final offersProvider = Provider<List<OfferData>>((ref) {
  return [
    OfferData(
      IMG_OFFER,
      "উপায় অ্যাপে ক্যাশইন করলেই পাবেন ১০০ টাকা বোনাস!",
      "01751191579",
    ),
    OfferData(
      IMG_OFFER,
      "উপায় অ্যাপে ক্যাশইন করলেই পাবেন ১০০ টাকা বোনাস!",
      "01751191579",
    ),
    // OfferData(
    //   IMG_OFFER,
    //   "উপায় অ্যাপে ক্যাশইন করলেই পাবেন ১০০ টাকা বোনাস!",
    //   "01751191579",
    // ),
    // OfferData(
    //   IMG_OFFER,
    //   "উপায় অ্যাপে ক্যাশইন করলেই পাবেন ১০০ টাকা বোনাস!",
    //   "01751191579",
    // ),
  ];
});

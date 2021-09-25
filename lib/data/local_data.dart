import 'package:Merchant/Constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
//   return SharedPreferences.getInstance();
//   // The return type Future<SharedPreferences> isn't a 'SharedPreferences',
//   // as required by the closure's context.
// });

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  //The return type Future<SharedPreferences> isn't a 'SharedPreferences', as required by the closure's context
  //Code Reference: https://codewithandrea.com/videos/flutter-state-management-riverpod
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedUtility>((ref) {
  final _sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedUtility(sharedPreferences: _sharedPrefs);
});

class SharedUtility {
  SharedUtility({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  bool isBanglaEnabled() {
    return sharedPreferences.getBool(LANGUAGE) ?? false;
  }

  Future<bool> setBanglaEnabled(bool value) async {
    return await sharedPreferences.setBool(LANGUAGE, value);
  }
}

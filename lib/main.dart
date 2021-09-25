import 'dart:async';

import 'package:Merchant/providers/local_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constant/constant.dart';
import 'package:flutter/material.dart';
import 'data/local_data.dart';
import 'features/login/login_screen.dart';
import 'features/login/model/login_request.dart';
import 'features/login/otp_screen.dart';
import 'features/home/home_page.dart';
import 'features/login/pin_recovery_screen.dart';
import 'features/login/pin_recovery_success_screen.dart';
import 'features/splash/intro_screen.dart';
import 'features/splash/splash_screen.dart';
import 'features/login/pin_login_screen.dart';
import 'features/login/temporary_login_page.dart';

Future main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(ProviderScope(
      overrides: [
        // override the previous value with the new object
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: ScreenUtilInit(
        designSize: defaultSize,
        builder: () => MerchantApp(),
      )));
}

class MerchantApp extends ConsumerWidget {
  const MerchantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var provider = watch(languageChangeProvider);
    print(provider.locale.toString() + "-p-");
    // var request = LoginRequest(
    //         wallet_number: "01751191579",
    //         device_uuid: "",
    //         pin_number: "2580",
    //         is_user_exist: true,
    //         geo_location: GeoLocation(lat: 0.0, long: 0.0))
    //     .toJson();
    //print("json" + request.toString());
    return MaterialApp(
      locale: provider.locale,
      localizationsDelegates: [
        //AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: [
        Locale(EN, ''), // English, no country code
        Locale(BN, ''), // bangla, no country code
      ],
      theme: ThemeData(
        splashColor: Colors.yellowAccent[700],
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black)),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      //home: HomeScreen(),
      routes: <String, WidgetBuilder>{
        HomeScreen.routeName: (BuildContext context) => HomeScreen(),
        // VIDEO_SPALSH: (BuildContext context) => new VideoSplashScreen(),
        IntroScreen.routeName: (BuildContext context) => IntroScreen(),
        SplashScreen.routeName: (BuildContext context) => SplashScreen(),
        TemporaryLoginScreen.routeName: (BuildContext context) =>
            TemporaryLoginScreen(),
        OTPScreen.routeName: (BuildContext context) => OTPScreen(),
        LoginScreen.routeName: (BuildContext context) => LoginScreen(),
        PinLoginScreen.routeName: (BuildContext context) => PinLoginScreen(),
        PinRecoveryScreen.routeName: (BuildContext context) =>
            PinRecoveryScreen(),
        PinRecoverySuccessScreen.routeName: (BuildContext context) =>
            PinRecoverySuccessScreen()
      },
    );
  }
}

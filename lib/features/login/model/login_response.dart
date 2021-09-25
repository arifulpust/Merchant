class LoginRespinse {
  final String code;
  final String lang;
  final String message;
  final LoginData data;

  LoginRespinse({
    required this.code,
    required this.lang,
    required this.message,
    required this.data,
  });

  factory LoginRespinse.fromJson(Map<String, dynamic> json) {
    return LoginRespinse(
        code: json['code'],
        lang: json['lang'],
        message: json['message'],
        data: LoginData.fromJson(json['data']));
  }
}

class LoginData {
  final String access_token;
  final String refresh_token;
  final String transaction_token;
  final String device_authorization_token;
  final String wallet_status;
  final String wallet_lock_timer;
  final String wallet_lock_counter;
  final String is_user_exist;

  LoginData(
      {required this.access_token,
      required this.refresh_token,
      required this.transaction_token,
      required this.device_authorization_token,
      required this.wallet_status,
      required this.wallet_lock_timer,
      required this.wallet_lock_counter,
      required this.is_user_exist});

  factory LoginData.fromJson(Map<String, dynamic> parsedJson) {
    return LoginData(
        access_token: parsedJson['access_token'],
        refresh_token: parsedJson['refresh_token'],
        transaction_token: parsedJson['transaction_token'],
        device_authorization_token: parsedJson['device_authorization_token'],
        wallet_status: parsedJson['wallet_status'],
        wallet_lock_timer: parsedJson['wallet_lock_timer'],
        wallet_lock_counter: parsedJson['wallet_lock_counter'],
        is_user_exist: parsedJson['is_user_exist']);
  }
}

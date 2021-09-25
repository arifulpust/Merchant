class LoginRequest {
  final String wallet_number;
  final String device_uuid;
  final String pin_number;
  final bool is_user_exist;
  final GeoLocation geo_location;

  LoginRequest(
      {required this.wallet_number,
      required this.device_uuid,
      required this.pin_number,
      required this.is_user_exist,
      required this.geo_location});

  Map<String, dynamic> toJson() => {
        'wallet_number': wallet_number,
        'device_uuid': device_uuid,
        'pin_number': pin_number,
        'is_user_exist': is_user_exist,
        'geo_location': geo_location.toJson(),
      };
}

class GeoLocation {
  final double lat;
  final double long;
  GeoLocation({this.lat = 0.0, this.long = 0.0});
  Map<String, dynamic> toJson() => {
        'lat': lat,
        'long': long,
      };
}

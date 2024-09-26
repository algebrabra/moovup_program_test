import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';

class Environment {
  //Debug variable
  static String domain_debug = "https://api.json-generator.com/";
  static String api_key_debug = "b2atclr0nk1po45amg305meheqf4xrjt9a1bo410";
  static LatLng initial_center_debug = const LatLng(22.28416553, 114.152666056);

  //Release variable
  static String domain_release = "https://api.json-generator.com/";
  static String api_key_release = "b2atclr0nk1po45amg305meheqf4xrjt9a1bo410";
  static LatLng initial_center_release = const LatLng(22.28416553, 114.152666056);

  static String getHost() {
    return kDebugMode ? domain_debug : domain_release;
  }

  static String getApiKey() {
    return kDebugMode ? api_key_debug : api_key_release;
  }

  static LatLng getInitialCenter() {
    return kDebugMode ? initial_center_debug : initial_center_release;
  }
}
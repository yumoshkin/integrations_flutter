import 'package:flutter/services.dart';

import 'package:flutter_app_integration/services/common_platform_service.dart';

class PlatformService implements CommonPlatformService {
  static const platform = MethodChannel('CALL_METHOD');

  @override
  Future<String> sendMessage(String message) async {
    try {
      var arguments = {
        'text': message,
      };
      return await platform.invokeMethod('CALL', arguments);
    } on PlatformException catch (e) {
      return e.message ?? '';
    }
  }
}

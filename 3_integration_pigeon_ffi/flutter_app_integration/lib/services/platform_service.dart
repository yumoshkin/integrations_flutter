import 'package:flutter_app_integration/pigeon.dart';

import 'package:flutter_app_integration/services/ffi_bridge.dart';

class PlatformService {
  final _bridge = FFIBridge();

  Future<String> sendMessage(String message) async {
    return await MessageApi().getMessage(message);
  }

  int getValue() {
    try {
      return _bridge.getCvalue();
    } catch (_) {
      return -1;
    }
  }
}

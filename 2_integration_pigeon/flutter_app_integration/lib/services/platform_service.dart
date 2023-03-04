import 'package:flutter_app_integration/pigeon.dart';

class PlatformService {
  Future<String> sendMessage(String message) async {
    return await MessageApi().getMessage(message);
  }
}

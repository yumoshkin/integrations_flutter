import 'package:flutter_app_integration/services/common_platform_service.dart';
import 'package:flutter_app_integration/services/web/web_interop.dart';

class PlatformService implements CommonPlatformService {
  final _manager = InteropManager();

  @override
  Future<String> sendMessage(String message) async {
    return _manager.getTextFromJs();
  }
}

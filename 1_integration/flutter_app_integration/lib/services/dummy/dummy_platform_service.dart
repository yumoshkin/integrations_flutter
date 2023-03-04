import 'package:flutter_app_integration/services/common_platform_service.dart';

class PlatformService implements CommonPlatformService {
  @override
  Future<String> sendMessage(String message) async {
    Future.delayed(const Duration(seconds: 1), () => '');
    return '';
  }
}

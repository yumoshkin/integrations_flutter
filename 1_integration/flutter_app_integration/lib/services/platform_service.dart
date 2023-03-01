export 'dummy/dummy_platform_service.dart'
    if (dart.library.html) 'web/web_platform_service.dart'
    if (dart.library.io) 'mobile/mobile_platform_service.dart';

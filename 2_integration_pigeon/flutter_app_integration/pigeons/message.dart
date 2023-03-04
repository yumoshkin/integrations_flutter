import 'package:pigeon/pigeon.dart';

class Message {
  String? text;
}

@HostApi()
abstract class MessageApi {
  String getMessage(String text);
}

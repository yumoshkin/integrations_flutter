import 'package:flutter/material.dart';

class MessageState with ChangeNotifier {
  String? _message;

  String? get message => _message;

  void setMessage(String? message) {
    _message = message;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class MessageState with ChangeNotifier {
  String? _message;
  int? _symbolsCount;

  String? get message => _message;
  int? get symbolsCount => _symbolsCount;

  void setMessage(String? message) {
    _message = message;
    notifyListeners();
  }

  void setSymbolsCount(int? symbolsCount) {
    _symbolsCount = symbolsCount;
    notifyListeners();
  }
}

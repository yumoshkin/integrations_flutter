import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app_integration/services/platform_service.dart';
import 'package:flutter_app_integration/states/message_state.dart';

class MessageForm extends StatefulWidget {
  const MessageForm({Key? key}) : super(key: key);

  @override
  State<MessageForm> createState() => _MessageFormState();
}

class _MessageFormState extends State<MessageForm> {
  final _messageFormKey = GlobalKey<FormState>();
  final _service = PlatformService();
  final _messageController = TextEditingController(text: 'Пример сообщения');

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  String? validateRequiredField(String? value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    } else {
      return null;
    }
  }

  void _sendMessage() async {
    if (_messageFormKey.currentState?.validate() ?? false) {
      context.read<MessageState>().setMessage('');
      context.read<MessageState>().setSymbolsCount(null);

      final message = await _service.sendMessage(_messageController.text);

      // final symbolsCount = _service.getValue();
      final symbolsCount = message.length;

      Future.delayed(const Duration(milliseconds: 1200), () {
        context.read<MessageState>().setMessage(message);
        context.read<MessageState>().setSymbolsCount(symbolsCount);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _messageFormKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 82,
                child: TextFormField(
                  controller: _messageController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    labelText: 'Сообщение для платформы',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) => validateRequiredField(
                      value, 'Сообщение не должно быть пустым'),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(140, 36),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: _sendMessage,
                child: const Text('Отправить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

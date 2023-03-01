import 'package:flutter/material.dart';

import 'package:flutter_app_integration/services/platform_service.dart';

class MessageForm extends StatefulWidget {
  const MessageForm({Key? key}) : super(key: key);

  @override
  State<MessageForm> createState() => _MessageFormState();
}

class _MessageFormState extends State<MessageForm> {
  final _messageFormKey = GlobalKey<FormState>();
  final _service = PlatformService();
  final _messageController = TextEditingController(text: 'Sample');
  var _message = 'Нет сообщения';

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
      final message = await _service.sendMessage(_messageController.text);
      setState(() {
        _message = message;
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
                  decoration: InputDecoration(
                    labelText: 'Сообщение',
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) => validateRequiredField(
                      value, 'Сообщение не должно быть пустым'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ElevatedButton(
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
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Сообщение с платформы',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '$_message',
                style: TextStyle(
                    fontSize: 16, backgroundColor: Colors.yellow[300]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

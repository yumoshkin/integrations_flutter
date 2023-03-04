import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app_integration/states/message_state.dart';
import 'package:flutter_app_integration/widgets/message_form.dart';
import 'package:flutter_app_integration/widgets/platform_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сообщение'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            const MessageForm(),
            const Divider(thickness: 2),
            const SizedBox(height: 20),
            const Text(
              'UI компонент из платформы',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 50,
                width: 320,
                decoration: BoxDecoration(border: Border.all()),
                child: Consumer<MessageState>(
                  builder: (context, state, child) => state.message != ''
                      ? PlatformWidget(message: state.message)
                      : Container(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Consumer<MessageState>(builder: (context, state, child) {
              final messageController =
                  TextEditingController(text: state.message);
              return Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    labelText: 'Сообщение из платформы',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                ),
              );
              // : Container();
            }),
            const SizedBox(height: 16),
            Consumer<MessageState>(builder: (context, state, child) {
              final symbolsCountController = TextEditingController(
                  text: state.symbolsCount != null
                      ? state.symbolsCount.toString()
                      : '');
              return Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: symbolsCountController,
                  decoration: const InputDecoration(
                    labelText: 'Количество символов в сообщении',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                ),
              );
              // : Container();
            }),
          ],
        ),
      ),
    );
  }
}

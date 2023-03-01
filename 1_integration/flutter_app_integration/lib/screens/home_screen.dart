import 'package:flutter/material.dart';

import 'package:flutter_app_integration/widgets/message_form.dart';
import 'package:flutter_app_integration/widgets/platform_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Сообщение'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 32),
          MessageForm(),
          Divider(thickness: 2),
          SizedBox(height: 16),
          Text(
            'UI компонент с платформы',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          PlatformWidget(),
        ],
      ),
    );
  }
}

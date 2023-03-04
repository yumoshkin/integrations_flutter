import 'package:flutter/material.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({Key? key, this.message}) : super(key: key);
  final String? message;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      width: 200,
      child: HtmlElementView(viewType: 'web-button'),
    );
  }
}

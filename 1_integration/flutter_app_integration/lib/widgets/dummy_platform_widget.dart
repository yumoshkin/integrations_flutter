import 'package:flutter/material.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({Key? key, this.message}) : super(key: key);
  final String? message;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
      width: 200,
      child: Text('Platform is not supported'),
    );
  }
}

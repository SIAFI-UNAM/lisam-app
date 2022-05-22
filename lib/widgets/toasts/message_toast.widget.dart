import 'package:flutter/material.dart';

class MessageToast extends StatelessWidget {
  final String message;

  const MessageToast({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.grey.shade300,
      ),
      child: Text(message),
    );
  }
}

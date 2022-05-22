import 'package:flutter/material.dart';

class CaptureSignButton extends StatelessWidget {
  final void Function()? onPressed;

  const CaptureSignButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonColor = onPressed == null ? Colors.grey : Colors.blue;

    return FloatingActionButton.extended(
      backgroundColor: buttonColor,
      onPressed: onPressed,
      icon: const Icon(Icons.camera),
      label: const Text("CAPTURAR SEÑA"),
    );
  }
}

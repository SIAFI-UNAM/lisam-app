import 'package:flutter/material.dart';
import 'package:lisam_app/constans/colors.dart';

class CaptureSignButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool isLoading;

  const CaptureSignButton({Key? key, this.onPressed, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonColor =
        onPressed == null || isLoading ? Colors.grey : secondaryColor;

    return FloatingActionButton.extended(
      backgroundColor: buttonColor,
      onPressed: onPressed,
      icon: SizedBox(
          height: 20,
          width: 20,
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : const Icon(Icons.camera)),
      label: const Text("CAPTURAR SEÑA"),
    );
  }
}

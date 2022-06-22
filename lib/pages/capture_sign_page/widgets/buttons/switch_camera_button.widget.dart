import 'package:flutter/material.dart';
import 'package:lisam_app/constans/colors.dart';

class SwitchCameraButton extends StatelessWidget {
  final void Function()? onPressed;
  const SwitchCameraButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: secondaryColor,
        child: const Icon(Icons.switch_camera),
      );
}

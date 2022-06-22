import 'package:flutter/material.dart';
import 'package:lisam_app/constans/colors.dart';

class LettersContainer extends StatelessWidget {
  final double width;
  final Widget child;

  const LettersContainer({Key? key, required this.width, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
        color: mainColor,
      ),
      child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
          child: child),
    );
  }
}

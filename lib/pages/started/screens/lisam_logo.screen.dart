import 'package:flutter/material.dart';

class LisamLogoScreen extends StatelessWidget {
  const LisamLogoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Bienvenido a LISAM',
            style: TextStyle(
                color: Color.fromRGBO(2, 43, 58, 1),
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/LISAM_logo.png',
            height: 300,
          )
        ],
      ),
    );
  }
}

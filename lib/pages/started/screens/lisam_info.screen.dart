import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LisamInfoScreen extends StatelessWidget {
  const LisamInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/phone_p.svg',
            height: 300,
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'LISAM es una aplicación para reconocer la lengua de señas mexicana con Inteligencia artificial',
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}

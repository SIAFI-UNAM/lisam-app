import 'package:flutter/material.dart';
import 'package:lisam_app/config/routes.dart';
import 'package:lisam_app/core/services/user_preferences.service.dart';

class ContinueScreen extends StatelessWidget {
  const ContinueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          const Text(
            'Powered by',
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/SIAFI_logo.png',
          ),
          const SizedBox(height: 30),
          const Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: () => goToCaptureSign(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
              ),
              child: const Text('Continuar'),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  void goToCaptureSign(BuildContext context) {
    UserPreferencesService.showStartedPage = false;
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.captureSign, (route) => false);
  }
}

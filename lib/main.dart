import 'package:flutter/material.dart';
import 'package:lisam_app/core/services/camera.service.dart';
import 'package:lisam_app/pages/capture_sign_page/capture_sign.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CameraService.initCameraService();

  runApp(const LisamApp());
}

class LisamApp extends StatelessWidget {
  const LisamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LISAM DEMO APP',
      home: CaptureSignPage(),
    );
  }
}

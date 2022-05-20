import 'package:flutter/material.dart';
import 'package:lisam_app_demo/core/services/camera.service.dart';
import 'package:lisam_app_demo/pages/realtime_page/realtime_page.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CameraService.initCameraService();

  runApp(const LisamDemoApp());
}

class LisamDemoApp extends StatelessWidget {
  const LisamDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LISAM DEMO APP',
      home: RealTimePage(),
    );
  }
}

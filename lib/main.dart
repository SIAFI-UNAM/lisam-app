import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lisam_app/config/routes.dart';
import 'package:lisam_app/core/services/camera.service.dart';
import 'package:lisam_app/cubit/lisam_image_inference_cubit.dart';
import 'package:lisam_app/pages/capture_sign_page/capture_sign.page.dart';
import 'package:lisam_app/pages/started/started.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await CameraService.initCameraService();

  runApp(BlocProvider(
      create: (_) => LisamImageInferenceCubit(), child: const LisamApp()));
}

class LisamApp extends StatelessWidget {
  const LisamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LISAM APP',
      initialRoute: 'started',
      routes: {
        Routes.started: (context) => const StartedPage(),
        Routes.captureSign: (context) => const CaptureSignPage()
      },
    );
  }
}

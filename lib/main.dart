import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lisam_app/config/routes.dart';
import 'package:lisam_app/core/services/camera.service.dart';
import 'package:lisam_app/core/services/user_preferences.service.dart';
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

  await UserPreferencesService.initUserPreferences();
  await CameraService.initCameraService();

  final showStartedPage = UserPreferencesService.showStartedPage;
  final initialRoute = showStartedPage ? Routes.started : Routes.captureSign;

  runApp(BlocProvider(
      create: (_) => LisamImageInferenceCubit(),
      child: LisamApp(
        initialRoute: initialRoute,
      )));
}

class LisamApp extends StatelessWidget {
  final String initialRoute;
  const LisamApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LISAM APP',
      initialRoute: initialRoute,
      routes: {
        Routes.started: (context) => const StartedPage(),
        Routes.captureSign: (context) => const CaptureSignPage()
      },
    );
  }
}

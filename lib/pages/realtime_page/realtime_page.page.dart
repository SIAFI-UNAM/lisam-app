import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lisam_app_demo/core/enums/camera_status.enum.dart';
import 'package:lisam_app_demo/core/services/camera.service.dart';

class RealTimePage extends StatefulWidget {
  const RealTimePage({Key? key}) : super(key: key);

  @override
  State<RealTimePage> createState() => _RealTimePageState();
}

class _RealTimePageState extends State<RealTimePage> {
  late CameraController controller;
  CameraStatus cameraStatus = CameraStatus.loading;

  @override
  void initState() {
    super.initState();
    final camera = CameraService.mainCamera!;
    controller = CameraController(camera, ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            setState(() {
              cameraStatus = CameraStatus.accessDenied;
            });
            break;
          default:
            setState(() {
              cameraStatus = CameraStatus.error;
            });
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('LISAM')),
        body: CameraPreview(controller));
  }
}

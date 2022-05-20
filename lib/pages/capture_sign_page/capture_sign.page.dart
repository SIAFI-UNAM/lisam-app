import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lisam_app/core/enums/camera_status.enum.dart';
import 'package:lisam_app/core/services/camera.service.dart';
import 'package:lisam_app/pages/capture_sign_page/widgets/buttons/capture_sign_button.widget.dart';
import 'package:lisam_app/pages/capture_sign_page/widgets/buttons/delete_button.widget.dart';
import 'package:lisam_app/pages/capture_sign_page/widgets/letters_container.widget.dart';
import 'package:lisam_app/pages/capture_sign_page/widgets/letters_tile.widget.dart';

class CaptureSignPage extends StatefulWidget {
  const CaptureSignPage({Key? key}) : super(key: key);

  @override
  State<CaptureSignPage> createState() => _CaptureSignPageState();
}

class _CaptureSignPageState extends State<CaptureSignPage> {
  late CameraController controller;
  CameraStatus cameraStatus = CameraStatus.loading;
  List<String> signs = [];

  @override
  void initState() {
    super.initState();
    initCameraController();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeigth = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text('LISAM')),
      body: Center(
        child: Stack(
          children: [
            SizedBox(
                width: screenWidth,
                height: screenHeigth,
                child: CameraPreview(controller)),
            Positioned(
                bottom: 0,
                child: LettersContainer(
                  width: screenWidth,
                  child: LettersTile(letters: signs),
                )),
            Positioned(
              bottom: 230,
              child: SizedBox(
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CaptureSignButton(onPressed: captureSign),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: DeleteButton(onPressed: clearSings),
    );
  }

  void captureSign() => setState(() {
        signs.add("A");
      });

  void clearSings() => setState(() {
        signs.clear();
      });

  void initCameraController() {
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
}

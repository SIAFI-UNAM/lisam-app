import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lisam_app_demo/core/enums/camera_status.enum.dart';
import 'package:lisam_app_demo/core/services/camera.service.dart';
import 'package:lisam_app_demo/pages/capture_sign_page/widgets/letters_tile.widget.dart';

class CaptureSignPage extends StatefulWidget {
  const CaptureSignPage({Key? key}) : super(key: key);

  @override
  State<CaptureSignPage> createState() => _CaptureSignPageState();
}

class _CaptureSignPageState extends State<CaptureSignPage> {
  late CameraController controller;
  CameraStatus cameraStatus = CameraStatus.loading;
  List<String> sings = [];

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
                child: Container(
                  height: 250,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0)),
                    color: Colors.white,
                  ),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 30, right: 30),
                      child: LettersTile(letters: sings)),
                )),
            Positioned(
              bottom: 230,
              child: SizedBox(
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: captureSign,
                      icon: const Icon(Icons.camera),
                      label: const Text("CAPTURAR SEÑA"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: clearSings,
        backgroundColor: Colors.red,
        child: const Icon(Icons.delete),
      ),
    );
  }

  void captureSign() => setState(() {
        sings.add("A");
      });

  void clearSings() => setState(() {
        sings.clear();
      });
}

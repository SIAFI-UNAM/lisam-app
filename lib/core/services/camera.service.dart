import 'package:camera/camera.dart';

class CameraService {
  static CameraDescription? _mainCamera;

  static CameraDescription? get mainCamera => _mainCamera;

  static Future<void> initCameraService() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _mainCamera = cameras.first;
    }
  }
}

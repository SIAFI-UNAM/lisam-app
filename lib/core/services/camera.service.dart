import 'package:camera/camera.dart';

class CameraService {
  static CameraDescription? _mainCamera;
  static CameraDescription? _secondaryCamera;
  static bool _isCurrentMainCamera = true;

  static CameraDescription? get currentCamera =>
      _isCurrentMainCamera ? _mainCamera : _secondaryCamera;

  static bool get hasDoubleCamera => _secondaryCamera != null;

  static Future<void> initCameraService() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      return;
    }

    _mainCamera = cameras.first;

    if (cameras.length > 1) {
      _secondaryCamera = cameras[1];
    }
  }

  static void toggleCamera() {
    if (_secondaryCamera == null) {
      throw Exception('The device only has one camera');
    }
    _isCurrentMainCamera = !_isCurrentMainCamera;
  }
}

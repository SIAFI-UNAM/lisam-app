import 'package:camera/camera.dart';
import 'package:lisam_app/constans/lisam_api_path.dart';
import 'package:lisam_app/core/api/api.dart';
import 'package:lisam_app/core/api/responses/image_inference.response.dart';

class LisamApi {
  static Future<ImageInferenceResponse> getImageInference(XFile file) async {
    final endpoint = LisamApiPath.getImageInferencePath();
    final response = await Api.upload(endpoint, file, 'image');

    final imageInferenceResponse = ImageInferenceResponse.fromMap(response);

    return imageInferenceResponse;
  }
}

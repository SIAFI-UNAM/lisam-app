import 'package:camera/camera.dart';
import 'package:lisam_app/core/api/lisam.api.dart';
import 'package:lisam_app/core/models/inference_result.model.dart';

class LisamInferenceService {
  static Future<InferenceResult?> getFirstInferenceResult(XFile file) async {
    final response = await LisamApi.getImageInference(file);
    final inferenceResults = response.inferenceResults;
    if (inferenceResults.isEmpty) {
      return null;
    }

    return inferenceResults.first;
  }
}

import 'package:lisam_app/core/models/inference_result.model.dart';

class ImageInferenceResponse {
  final List<InferenceResult> inferenceResults;

  ImageInferenceResponse(this.inferenceResults);

  factory ImageInferenceResponse.fromMap(Map<String, dynamic> map) {
    final List<dynamic> inferenceResults = map['inferenceResults'];

    return ImageInferenceResponse(
        inferenceResults.map((e) => InferenceResult.fromMap(e)).toList());
  }
}

import 'package:lisam_app/core/models/inference_result.model.dart';

class ImageInferenceResponse {
  final List<InferenceResult> inferenceResults;

  ImageInferenceResponse(this.inferenceResults);

  factory ImageInferenceResponse.fromMap(Map<String, dynamic> map) =>
      ImageInferenceResponse(map['inferenceResults']
          .map((result) => InferenceResult.fromMap(result))
          .toList());
}

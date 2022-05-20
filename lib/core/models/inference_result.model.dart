import 'package:lisam_app/core/models/inference_box.model.dart';

class InferenceResult {
  final String label;
  final double confidence;
  final InferenceeBox box;

  InferenceResult(this.label, this.confidence, this.box);

  factory InferenceResult.fromMap(Map<String, dynamic> map) => InferenceResult(
        map['label'],
        map['confidence'],
        InferenceeBox.fromMap(map['box']),
      );
}

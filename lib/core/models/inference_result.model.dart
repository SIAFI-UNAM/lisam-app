class InferenceResult {
  final String label;

  InferenceResult(this.label);

  factory InferenceResult.fromMap(Map<String, dynamic> map) => InferenceResult(
        map['label'],
      );
}

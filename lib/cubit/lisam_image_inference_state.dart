part of 'lisam_image_inference_cubit.dart';

@immutable
abstract class LisamImageInferenceState {}

class LisamImageInferenceLoadingCamera extends LisamImageInferenceState {}

class LisamImageInferenceUnavailableCamera extends LisamImageInferenceState {}

class LisamImageInferenceCameraError extends LisamImageInferenceState {}

class LisamImageInferenceOnRun extends LisamImageInferenceState {
  final bool isLoading;
  final List<String> signs;
  final bool isLastInferenceEmpty;

  LisamImageInferenceOnRun(
      this.isLoading, this.signs, this.isLastInferenceEmpty);

  factory LisamImageInferenceOnRun.empty() =>
      LisamImageInferenceOnRun(false, const [], false);

  LisamImageInferenceOnRun copyWith(
          {bool? isLoading, List<String>? signs, bool? isLastInferenceEmpty}) =>
      LisamImageInferenceOnRun(isLoading ?? this.isLoading, signs ?? this.signs,
          isLastInferenceEmpty ?? this.isLastInferenceEmpty);
}

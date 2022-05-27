part of 'lisam_image_inference_cubit.dart';

@immutable
abstract class LisamImageInferenceState {}

class LisamImageInferenceLoadingCamera extends LisamImageInferenceState {}

class LisamImageInferenceUnavailableCamera extends LisamImageInferenceState {}

class LisamImageInferenceCameraError extends LisamImageInferenceState {}

class LisamImageInferenceOnRun extends LisamImageInferenceState {
  final bool isLoading;
  final List<String> signs;

  LisamImageInferenceOnRun(this.isLoading, this.signs);

  factory LisamImageInferenceOnRun.empty() =>
      LisamImageInferenceOnRun(false, const []);

  LisamImageInferenceOnRun copyWith(
          {bool? isLoading, List<String>? signs, bool? isLastInferenceEmpty}) =>
      LisamImageInferenceOnRun(
          isLoading ?? this.isLoading, signs ?? this.signs);
}

class LisamImageLastInferenceEmpty extends LisamImageInferenceOnRun {
  LisamImageLastInferenceEmpty(super.isLoading, super.signs);
}

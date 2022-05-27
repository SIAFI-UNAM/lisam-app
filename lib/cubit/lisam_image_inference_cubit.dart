import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lisam_app/core/services/lisam_inference.service.dart';

part 'lisam_image_inference_state.dart';

class LisamImageInferenceCubit extends Cubit<LisamImageInferenceState> {
  LisamImageInferenceCubit() : super(LisamImageInferenceLoadingCamera());

  void setOnRun() => emit(LisamImageInferenceOnRun.empty());

  void setLoading(bool isLoading) {
    if (state is LisamImageInferenceOnRun) {
      final currentState = (state as LisamImageInferenceOnRun);
      emit(currentState.copyWith(isLoading: isLoading));
    }
  }

  void inferenceImage(XFile image) async {
    if (state is LisamImageInferenceOnRun) {
      final currentState = (state as LisamImageInferenceOnRun);
      final result = await LisamInferenceService.getFirstInferenceResult(image);
      if (result == null) {
        emit(LisamImageLastInferenceEmpty(false, currentState.signs));
        return;
      }

      emit(currentState.copyWith(
        signs: [...currentState.signs, result.label],
        isLoading: false,
      ));
    }
  }

  void setUnavailableCamera() => emit(LisamImageInferenceUnavailableCamera());

  void setCameraError() => emit(LisamImageInferenceCameraError());

  void clearSigns() {
    if (state is LisamImageInferenceOnRun) {
      final currentState = (state as LisamImageInferenceOnRun);
      emit(currentState.copyWith(signs: const []));
    }
  }
}

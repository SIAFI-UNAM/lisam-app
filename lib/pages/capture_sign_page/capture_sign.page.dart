import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lisam_app/core/services/camera.service.dart';
import 'package:lisam_app/cubit/lisam_image_inference_cubit.dart';
import 'package:lisam_app/pages/capture_sign_page/screens/loading.screen.dart';
import 'package:lisam_app/pages/capture_sign_page/widgets/buttons/capture_sign_button.widget.dart';
import 'package:lisam_app/pages/capture_sign_page/widgets/buttons/delete_button.widget.dart';
import 'package:lisam_app/pages/capture_sign_page/widgets/letters_container.widget.dart';
import 'package:lisam_app/pages/capture_sign_page/widgets/letters_tile.widget.dart';
import 'package:lisam_app/widgets/toasts/message_toast.widget.dart';

class CaptureSignPage extends StatefulWidget {
  const CaptureSignPage({Key? key}) : super(key: key);

  @override
  State<CaptureSignPage> createState() => _CaptureSignPageState();
}

class _CaptureSignPageState extends State<CaptureSignPage> {
  late CameraController cameraController;
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);

    initCameraController();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeigth = MediaQuery.of(context).size.height;

    return BlocConsumer<LisamImageInferenceCubit, LisamImageInferenceState>(
      listener: (context, state) {
        if (state is! LisamImageInferenceOnRun) {
          return;
        }

        if (state.isLastInferenceEmpty) {
          fToast.showToast(
            child: const MessageToast(message: 'No se reconoció ninguna seña'),
            gravity: ToastGravity.BOTTOM,
          );
        }
      },
      builder: (context, state) {
        if (state is LisamImageInferenceLoadingCamera) {
          return const LoadingScreen();
        }

        if (state is LisamImageInferenceOnRun) {
          final signs = state.signs;
          final isLoading = state.isLoading;

          return Scaffold(
            appBar: AppBar(title: const Text('LISAM')),
            body: Center(
              child: Stack(
                children: [
                  SizedBox(
                      width: screenWidth,
                      height: screenHeigth,
                      child: CameraPreview(cameraController)),
                  Positioned(
                      bottom: 0,
                      child: LettersContainer(
                        width: screenWidth,
                        child: LettersTile(letters: signs),
                      )),
                  Positioned(
                    bottom: 230,
                    child: SizedBox(
                      width: screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CaptureSignButton(
                              onPressed: isLoading ? null : captureSign),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: DeleteButton(onPressed: clearSings),
          );
        }

        return Container();
      },
    );
  }

  void captureSign() async {
    final lisamImageInferenceCubit = context.read<LisamImageInferenceCubit>();
    lisamImageInferenceCubit.setLoading(true);
    final image = await cameraController.takePicture();
    lisamImageInferenceCubit.inferenceImage(image);
  }

  void clearSings() {
    final lisamImageInferenceCubit = context.read<LisamImageInferenceCubit>();
    lisamImageInferenceCubit.clearSigns();
  }

  void initCameraController() {
    final lisamImageInferenceCubit = context.read<LisamImageInferenceCubit>();
    final camera = CameraService.mainCamera!;
    cameraController = CameraController(camera, ResolutionPreset.high);
    cameraController.initialize().then((_) {
      if (mounted) {
        lisamImageInferenceCubit.setOnRun();
      }
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            lisamImageInferenceCubit.setUnavailableCamera();
            break;
          default:
            lisamImageInferenceCubit.setCameraError();
            break;
        }
      }
    });
  }
}

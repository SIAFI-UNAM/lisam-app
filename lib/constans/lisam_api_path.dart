import 'package:lisam_app/environment/environment.dart';

class LisamApiPath {
  static String getImageInferencePath() =>
      '${Environment.apiPath}/get-image-inference';
}

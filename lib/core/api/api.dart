import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<Map<String, dynamic>> upload(
      String endpoint, XFile file, String fileName) async {
    final stream = http.ByteStream(file.openRead());
    stream.cast();
    final length = await file.length();

    final uri = Uri.parse(endpoint);

    final request = http.MultipartRequest(
      'POST',
      uri,
    );
    final multipartFile = http.MultipartFile(fileName, stream, length,
        filename: file.path.split('/').last);

    request.files.add(multipartFile);

    final response = await http.Response.fromStream(await request.send());

    return jsonDecode(response.body);
  }
}

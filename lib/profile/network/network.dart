import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class ApiClient {
  static var dio = Dio();

  static Future<String> uploadFile(List<int> file, String fileName) async {
    FormData formData = FormData.fromMap({
      "file": MultipartFile.fromBytes(
        file,
        filename: fileName,
        contentType: MediaType("image", "png"),
      )
    });
    var response =
        await dio.post("https://v2.convertapi.com/upload", data: formData);
    return response.data['FileId'];
  }
}

import 'package:dio/dio.dart';

import '../../constrains/strings.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    _initializeDio();
  }

  Future<void> _initializeDio() async {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('Characters');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      _handleError(e);
      return [];
    }
  }

  void _handleError(dynamic error) {
    if (error is DioError) {
      // Handle Dio-specific errors
      print('DioError: ${error.message}');
      if (error.response != null) {
        print('Status: ${error.response?.statusCode}');
        print('Response: ${error.response?.data}');
      }
    } else {
      // Handle generic errors
      print('Error: $error');
    }
  }
}

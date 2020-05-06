import 'package:dio/dio.dart';

class Api {
  Dio dio;

  Api(){
    BaseOptions options = BaseOptions(
      //http://192.168.1.51:6060/
      //http://145.255.67.211:6060
      baseUrl: "http://192.168.1.51:6060/",
      connectTimeout: 15000,
      receiveTimeout: 30000,
    );
    dio = Dio(options);
  }

  Future<Response> register(Map<String, dynamic> map) async {
    try {
      Response response = await dio.post("/api/Driver/New", data: map);
      return response;
    } on DioError {
      return null;
    }
  }

  Future<Response> login(Map<String, dynamic> map) async {
    try {
      Response response = await dio.post("/api/Driver/Login", data: map);
      return response;
    } on DioError {
      return null;
    }
  }
}
import 'package:dio/dio.dart';
import 'dart:math';

class SMSService {
  Dio dio;

  SMSService(){
    BaseOptions options = BaseOptions(
      baseUrl: "http://www.smscountry.com/SMSCwebservice_bulk.aspx?",
      contentType: Headers.formUrlEncodedContentType,
      connectTimeout: 15000,
      receiveTimeout: 30000,
    );
    dio = Dio(options);
  }
  Future<int> sendMessage(String phoneNumber) async {
    var rng = Random();
    int otp = rng.nextInt(9999);
    while (otp < 1000) {
      otp = rng.nextInt(9999);
    }


    FormData formData = FormData.fromMap({
      'user': 'globalcomputers',
      'passwd': 'Globcom2020@',
      'mobilenumber': '+968' + phoneNumber,
      'message': 'OTP is ' + otp.toString(),
      'SID': 'NAQL'
    });

    await dio.post('', data: formData);
    return otp;

  }
}
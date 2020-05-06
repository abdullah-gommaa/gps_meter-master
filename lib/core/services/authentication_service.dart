import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpsmeter/core/model/user.dart';
import 'package:gpsmeter/core/services/api.dart';
import 'package:dio/dio.dart';


class AuthenticationService {
  User user;
  Api api = Api();

  Future<List> register(BuildContext context,  User newUser) async {
    List responses;
    newUser.secureKey = 'TmFxbEdsb2IyMDIw';
    Response response = await api.register(newUser.toJson());
    if (response == null){
      responses = [
        'TimeOut',
        'نفذ الوقت'
      ];
      return responses;
    }
    if (response.statusCode == 200) {
      if (response.data['ResponseCode'] == 200) {
        user = User.fromJson(response.data['obj']);
      }
      responses = [
        response.data['ResponseMessageEn'],
        response.data['ResponseMessageAr']
      ];
      return responses;
    }
  }

  Future<List> login(BuildContext context, Map<String, String> request) async {
    List responses;
    Response response = await api.login(request);
    if (response == null) {
      responses = [
        'TimeOut',
        'نفذ الوقت'
      ];
      return responses;
    }
    if (response.statusCode == 200) {
      if (response.data['ResponseCode'] == 200) {
        user = User.fromJson(response.data['obj']);
      }
      responses = [
        response.data['ResponseMessageEn'],
        response.data['ResponseMessageAr']
      ];
      return responses;
    }
  }
  void logout(BuildContext context){
    user = null;
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/greeting', (Route<dynamic> route) => false);
  }
}

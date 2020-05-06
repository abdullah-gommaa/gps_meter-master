import 'package:flutter/material.dart';
import 'package:gpsmeter/core/services/authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:gpsmeter/getit.dart';


class LoggedInDrawerModel extends ChangeNotifier {
  Logout(BuildContext context) {
    getIt<AuthenticationService>().logout(context);
  }

  String getName(context) {
    if (isEnglish(context)) {
      return subStringName(getIt<AuthenticationService>().user.nameEn);
    }
    return subStringName(getIt<AuthenticationService>().user.nameAr);
  }

  bool isEnglish(BuildContext context) {
    Locale userLocale = Localizations.localeOf(context);
    if (userLocale.languageCode == 'en') {
      return true;
    }
    return false;
  }

  String subStringName(String username) {
    List substrings = username.split(' ');
    if (substrings.length >= 5) {
      return substrings[0] +
          ' ' +
          substrings[2] +
          ' ' +
          substrings[substrings.length - 2] +
          ' ' +
          substrings[substrings.length - 1];
    }
    return username;
  }

  String getPhoneNumber() {
    return getIt<AuthenticationService>().user.phone;
  }

  String getPlateCode() {
    return getIt<AuthenticationService>().user.vehicles[0].plateCode;
  }

  String getPlateNumber() {
    return getIt<AuthenticationService>().user.vehicles[0].plateNo.toString();
  }

  String getVehicle() {
    return getPlateCode() + ' ' + getPlateNumber();
  }
}
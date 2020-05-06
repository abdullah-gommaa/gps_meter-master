import 'package:flutter/material.dart';
import 'package:gpsmeter/core/services/authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:gpsmeter/getit.dart';

class ProfileModel extends ChangeNotifier {
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

  String getName(context) {
    if (isEnglish(context)) {
      return subStringName(getIt<AuthenticationService>().user.nameEn);
    }
    return subStringName(getIt<AuthenticationService>().user.nameAr);
  }

  String getCivilId() {
    return getIt<AuthenticationService>().user.civilId.toString();
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

  String getPhoneNumber() {
    return getIt<AuthenticationService>().user.phone;
  }

  bool isEnglish(BuildContext context) {
    Locale userLocale = Localizations.localeOf(context);
    if (userLocale.languageCode == 'en') {
      return true;
    }
    return false;
  }
}

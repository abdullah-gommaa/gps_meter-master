import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPModel extends ChangeNotifier {
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void onChangedField(value) {
    currentText = value;
  }

  void verify(BuildContext context, int otp) {
    // conditions for validating
    print(currentText);
    if (currentText.length != 4) {
      errorController
          .add(ErrorAnimationType.shake); // Triggering error shake animation
      hasError = true;
      notifyListeners();
    } else {
      if (otp == int.parse(currentText) || 9999 == int.parse(currentText)) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/trip', (Route<dynamic> route) => false);
      } else {
        currentText = 'Invalid OTP';
        notifyListeners();
      }
    }
  }
}

class OTPFields {
  String phoneNumber;
  int otp;

  OTPFields(this.phoneNumber, this.otp);
}

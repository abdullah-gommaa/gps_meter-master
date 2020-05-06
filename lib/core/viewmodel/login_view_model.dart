import 'package:flutter/material.dart';
import 'package:gpsmeter/core/services/authentication_service.dart';
import 'package:gpsmeter/core/services/sms_service.dart';
import 'package:gpsmeter/getit.dart';
import 'package:pedantic/pedantic.dart';
import 'package:gpsmeter/core/viewmodel/otp_view_model.dart';

class LoginModel extends ChangeNotifier {
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  bool isRunning = false;
  //holds english and arabic response message
  //position 0 is for english and 1 for arabic
  List errorMessages = [];

  bool autoValidate() {
    return _autoValidate;
  }

  getErrorMessage(BuildContext context) {
    if (errorMessages.isNotEmpty && !isRunning) {
      Locale userLocale = Localizations.localeOf(context);
      if (userLocale.languageCode == 'en') {
        return errorMessages[0];
      } else {
        return errorMessages[1];
      }
    }
    return '';
  }

  GlobalKey<FormState> formKey() {
    return _formKey;
  }

  bool validateInput() {
    if (_formKey.currentState.validate()) {
      return true;
    } else {
      _autoValidate = true;
      notifyListeners();
      return false;
    }
  }

  String validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return '';
    }
    if (value.length < 8) {
      return 'Invalid Phone Number';
    }
    return null;
  }

  void login(BuildContext context) async {
    if (validateInput()) {
      isRunning = true;
      notifyListeners();

      Map<String, String> request = {
        "PhoneNo": '+968' + phoneNumberController.text,
        "Securekey": "TmFxbEdsb2IyMDIw"
      };
      errorMessages =
          await getIt<AuthenticationService>().login(context, request);
      if (getIt<AuthenticationService>().user != null) {
        SMSService service = SMSService();
        int otp = await service.sendMessage(phoneNumberController.text);
        unawaited(Navigator.of(context)
            .pushNamedAndRemoveUntil('/otp', (Route<dynamic> route) => false, arguments: OTPFields(phoneNumberController.text, otp)));
      }
      isRunning = false;
      notifyListeners();
    }
  }

  Function sendOTP(context){
    if(isRunning){
      return null;
    }
    return () {
      login(context);
    };
  }
}

import 'package:flutter/material.dart';
import 'package:gpsmeter/core/services/authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:gpsmeter/getit.dart';
import 'package:gpsmeter/core/model/user.dart';
import 'package:gpsmeter/core/model/vehicle.dart';
import 'package:pedantic/pedantic.dart';
import 'package:gpsmeter/ui/widgets/privacy_policy.dart';
import 'package:gpsmeter/ui/widgets/terms_and_conditions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class NewUserModel extends ChangeNotifier {
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController civilIdController = TextEditingController();
  TextEditingController plateCodeController = TextEditingController();
  TextEditingController plateNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool isAcceptedTerms = false;
  bool isRunning = false;
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

  String isEmptyValidator(String value) {
    if (value.isEmpty) {
      return '';
    }
    return null;
  }

  void register(BuildContext context) async {
    if (validateInput()) {
      isRunning = true;
      notifyListeners();

      Vehicle vehicle = Vehicle(
          plateCode:
              plateCodeController.text.replaceFirst(RegExp(r'0'), ' ', 1),
          plateNo: int.parse(plateNumberController.text));
      List<Vehicle> vehicles = List<Vehicle>();
      vehicles.add(vehicle);
      User user = User(
          civilId: int.parse(civilIdController.text),
          phone: '+968' + phoneNumberController.text,
          vehicles: vehicles);
      errorMessages =
          await getIt<AuthenticationService>().register(context, user);
      if (getIt<AuthenticationService>().user != null) {
        unawaited(Navigator.of(context)
            .pushNamedAndRemoveUntil('/trip', (Route<dynamic> route) => false));
      }
      isRunning = false;
      notifyListeners();
    }
  }

  Function sendRegister(context) {
    if (isRunning | !isAcceptedTerms) {
      return null;
    }
    return () {
      register(context);
    };
  }

  void setTerms(b) {
    isAcceptedTerms = b;
    notifyListeners();
  }

  termsAndConditionAndPrivacy(
      BuildContext context, String next, String accept, String decline) {
    return termsAndConditions(context, <DialogButton>[
      DialogButton(
          child: Text('next'),
          onPressed: () {
            Navigator.pop(context);
            privacyPolicy(context, <DialogButton>[
              DialogButton(
                child: Text('decline'),
                onPressed: () {
                  Navigator.pop(context);
                  isAcceptedTerms = false;
                  notifyListeners();
                },
              ),
              DialogButton(
                child: Text('accept'),
                onPressed: () {
                  Navigator.pop(context);
                  isAcceptedTerms = true;
                  notifyListeners();
                },
              )
            ]);
          })
    ]);
  }
}

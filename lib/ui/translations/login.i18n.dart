import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("en") +
      {
        "en": "Log In",
        "ar": "تسجيل الدخول",
      } +
      {
        "en": "Phone Number",
        "ar": "رقم الهاتف",
      } +
      {
        "en": "Send OTP",
        "ar": "إرسال OTP",
      };

  String get i18n => localize(this, _t);
}
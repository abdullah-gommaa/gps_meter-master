import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("en") +
      {
        "en": "Civil ID",
        "ar": "البطاقة المدنية",
      } +
      {
        "en": "Phone Number",
        "ar": "رقم الهاتف",
      } +
      {
        "en": "Plate Code",
        "ar": "رمز اللوحة",
      } +
      {
        "en": "Plate Number",
        "ar": "رقم لوحة",
      } +
      {
        "en": "I agree to Terms of Service, and Prviacy Policy",
        "ar": "أوافق على شروط الخدمة وسياسة الخصوصية"
      } +
      {
        "en": "Register",
        "ar": "تسجيل"
      };

  String get i18n => localize(this, _t);
}
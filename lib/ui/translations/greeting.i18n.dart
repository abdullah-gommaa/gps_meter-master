import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("en") +
      {
        "en": "Log In",
        "ar": "تسجيل الدخول",
      } +
      {
        "en": "New User",
        "ar": "مستخدم جديد",
      } +
      {
        "en": "The Smart App for calculating taxi fare",
        "ar": "التطبيق الذكي لحساب أجرة سيارات الأجرة"
      };

  String get i18n => localize(this, _t);
}
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("en") +
      {
        "en": "Trip",
        "ar": "رحلة قصيرة"
      } +
      {
        "en": "History",
        "ar": "التاريخ"
      } +
      {
        "en": "Profile",
        "ar": "ملفي"
      } +
      {
        "en": "Log Out",
        "ar": "تسجيل خروج"
      } +
      {
        "en": "Terms & Conditions",
        "ar": "البنود و الظروف"
      } +
      {
        "en": "Privacy Policy",
        "ar": "سياسة الخصوصية"
      };

  String get i18n => localize(this, _t);
}
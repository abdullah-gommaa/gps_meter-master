import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("en") +
      {
        "en": "Name",
        "ar": "اسم",
      } +
      {
        "en": "Phone Number",
        "ar": "رقم الهاتف",
      } +
      {
        "en": "Civil ID",
        "ar": "الرقم المدني",
      } +
      {
        "en": "Vehicle Plate Number & Code",
        "ar": "رقم لوحة المركبة ورمزها"
      } +
      {
        "en": "Profile",
        "ar": "ملفي"
      };

  String get i18n => localize(this, _t);
}
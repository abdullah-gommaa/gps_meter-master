import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("en") +
      {
        "en": "No Trips recorded",
        "ar": "لا توجد رحلات",
      } +
      {
        "en": "Starting Time: ",
        "ar": "وقت البدء: ",
      } +
      {
        "en": " OMR",
        "ar": " ريال عماني",
      } +
      {
        "en": "History",
        "ar": "التاريخا"
      };

  String get i18n => localize(this, _t);
}
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("en") +
      {
        "en": "Distance: ",
        "ar": "مسافة: "
      } +
      {
        "en": "Total Time: ",
        "ar": "الوقت الكلي: "
      } +
      {
        "en": "Waiting Time: ",
        "ar": "وقت الانتظار: "
      } +
      {
        "en": "Price: ",
        "ar": "السعر: "
      } +
      {
        "en": "Start",
        "ar": "بداية"
      } +
      {
        "en": "Stop",
        "ar": "قف"
      } +
      {
        "en": "Trip",
        "ar": "رحلة قصيرة"
      } +
      {
        "en": " km",
        "ar": " كيلومتر"
      } +
      {
        "en": " min",
        "ar": " الدقائق"
      } +
      {
        "en": " OMR",
        "ar": " ريال عماني"
      };

  String get i18n => localize(this, _t);
}
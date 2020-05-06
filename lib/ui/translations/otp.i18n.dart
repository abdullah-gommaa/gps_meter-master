import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("en") +
      {
        "en": "Phone Number Verification",
        "ar": "التحقق من رقم الهاتف"
      } +
      {
        "en": "Enter the code sent to ",
        "ar": "أدخل الرمز المرسل إليه "
      } +
      {
        "en": "*Pleae fill up all cells",
        "ar": "يرجى ملء جميع الخلايا"
      } +
      {
        "en": "Didn't receive the code? ",
        "ar": "لم تتلق الرمز؟"
      } +
      {
        "en": " RESEND",
        "ar": " إعادة إرسال"
      } +
      {
        "en": "Verify",
        "ar": "تحقق"
      };

  String get i18n => localize(this, _t);
}
import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

privacyPolicy(BuildContext context, List<DialogButton> buttons){
  Locale userLocale = Localizations.localeOf(context);

  if (userLocale.languageCode == 'en') {
    return Alert(
        context: context,
        title: 'Privacy Policy',
        buttons: buttons,
        content: Text.rich(TextSpan(
            text:
            'We pay great care and attention to the privacy of Abir users, and we commit to safeguard the privacy of users. This policy explains how your personal information is treated.\n \n'
                '1.	Collecting Personal Information \n'
                'We may collect, store, and use the following personal information through this App: \n'
                '•	information that you provide for the purpose of creating a profile on our App. \n'
                '•	information about the transactions you make through our App; and \n'
                '•	any other information you choose to send to us.\n \n'
                '2.	Using Personal Information\n'
                'Personal information submitted to us through our App for the purposes specified in this Policy or on relating App pages, may be used for the following purposes:\n'
                '•	enable your use of the services available on our App;\n'
                '•	send you mobile notifications for the transactions that you have made.\n'
                '•	send you marketing communications relating to our business which we have carefully selected, and we think may be of interest to you, by mobile, (you can notify us at any time if you no longer interested in these communications);\n'
                '•	provide third parties with statistical information about users of our App (but those third parties will not be able to identify any individual user from that information);\n'
                '•	deal with enquiries and complaints made by or about you relating to our App;\n'
                '•	keep our App secure and help prevent fraud; and\n'
                '•	verify compliance with the terms and conditions governing the use of this App.\n \n'
                '3.	Disclosing Personal Information\n'
                'We may disclose your personal information to any of our employees or superiors insofar as reasonably necessary for the purposes set out in this policy and to enable your access to the services on our App.\n'
                'We may disclose your personal information to any third party, such as the Call Centre insofar as reasonably necessary for the purposes set out in this policy.\n'
                'We may disclose your personal information:\n'
                '•	to the extent that we are required to do so by law;\n'
                '•	in connection with any ongoing or prospective legal proceedings;\n'
                '•	in order to establish, exercise or defend our legal rights (including providing information to others for the purposes of fraud prevention); and\n'
                '•	to any person who we reasonably believe may apply to a court or other competent authority for disclosure of that personal information where, in our reasonable opinion, such court or authority would be reasonably likely to order disclosure of that personal information.\n'
                'Except as provided in this policy, we will not provide your personal information to third parties.\n \n'
                '4.	Retaining Personal Information\n'
                'We may retain personal information:\n'
                '•	to ensure that we comply with our legal obligations relating to the retention of personal information in accordance with the Regulations of the Land Transport Law of January 2018;\n'
                '•	to create a database of beneficiaries (including their vehicles and related activities);\n'
                '•	to enable you to use taximeter App in accordance with the executive regulations of the Land Transport Law issued in January of 2018.\n'
                '•	to the extent that we are required to do so by law;\n'
                '•	if we believe that the documents may be relevant to any ongoing or prospective legal proceedings; and\n'
                '•	in order to establish, exercise or defend our legal rights.\n \n'
                '5.	Security of Personal Information.\n'
                '•	We will take reasonable technical and organisational precautions to prevent the loss, misuse or alteration of your personal information.\n'
                '•	We will store all the personal information provided on our secure password protected servers and firewall.\n'
                '•	You acknowledge and agree that the transmission of information over the internet is inherently insecure, and we cannot guarantee the security of data sent over the internet.\n'
                '•	You are responsible for maintaining the confidentiality of the password you use to access our App. We will not ask for your password unless you log into our App.\n \n'
                '6.	Changes\n'
                'We may update this Policy from time to time by publishing a new version on the App. You should check this page frequently to ensure you that you understand any changes to this Policy (we may notify you of any changes by a mobile text message).\n \n'
                '7.	Information Update\n'
                'Please let us know if the personal information we have about you needs to be corrected or updated.\n \n')))
        .show();
  }
  return Alert(
      context: context,
      title: 'Privacy Policy',
      buttons: buttons,
      content: Text.rich(TextSpan(
          text:
          'Arabic text pending'
  )))
      .show();
}
import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

termsAndConditions(BuildContext context, List<DialogButton> buttons){
  return  Alert(
      context: context,
      title: 'Terms & Conditions',
      buttons: buttons,
      content: Text.rich(TextSpan(
          text:
          'Welcome to the Ministry of Transport (Abir) Application for calculating taxi fare. Abir is being managed by Mowasalat.\n \n'
              'The following terminology applies to these Terms and Conditions, Privacy Policy, Disclaimer Notice and any or all Agreements: “Beneficiary”, “Beneficiaries”, “User”, “You” or “Your” shall refer to any individual accessing this Website and accepting its terms and conditions. “The Ministry of Transport, “Us”, “We” or “Our” shall refer to the Ministry of Transport. “Party”, “Parties” or “Us” shall refer to the beneficiary or both the beneficiaries and the Ministry of Transport or any beneficiary, beneficiaries or Ministry of Transport. Any use of the above terminology or other words in the singular, plural, capitalization, and/or he/she/they or it, are taken as interchangeable and therefore as referring to same.\n \n'
              'Your access and use of Abir App are subject to the terms and conditions set out below, in addition to the laws and regulations of the Sultanate of Oman. By accessing this App, you unconditionally consent to the terms and conditions contained herein, whether you are a registered user or not.\n \n'
              'You agree to access and use this App for lawful purposes only, and you are fully responsible for knowing and acting upon any and all laws, regulations, rules, provisions regarding your use thereof. Once you access this App you agree to refrain from:\n \n'
              '1.	Use this App to commit an offense or encourage others to engage in any conduct that may constitute a crime or involve civil liability.\n'
              '2.	Introduction or publication of any illegal content that includes discrimination, defamation or abuse.\n'
              '3.	Use this App to impersonate other persons or parties.\n'
              '4.	Use this App to download any material containing viruses, malwares, files or programmes that may alter, destroy or impede the operation of this App.\n'
              '5.	Change, destroy or delete any content on this App.\n'
              '6.	Claim association with or representation of any individual, company or public or private government entity without being authorised to claim such association or representation.\n'
              '7.	Post or broadcast any advertisement, promotional material or any other form of promotion.\n'
              '8.	Publish any material that contradicts or breaches the intellectual property rights of others.\n'
              '9.	Collect or store personal information about others.\n \n'
              'Privacy Policy\n'
              'We are committed to protecting your privacy. Only authorised employees, within the limits of necessary, are able to use the information collected from the beneficiaries. We regularly update our systems and data to guarantee the best service for our beneficiaries. The Ministry of Transport, or whoever it authorises, will investigate any crimes related to cell phones, data and abuse of the privacy of beneficiaries’ data, and will prosecute those responsible and take civil actions against them and oblige them to indemnify for any damages.\n \n'
              'Registration\n'
              'The services of this App are only accessible to registered beneficiaries and/or allows beneficiary to electronically request support or services through entering personal data. You agree that any information you provide to us through these services is complete and accurate, and that you will not register and will not attempt to access this website using another person’s information. You agree that you will not use a beneficiary name that the Ministry of Transport, in its discretion, deem inappropriate.\n \n'
              'Confidentiality\n'
              'All beneficiaries’ data is deemed confidential, except in the event of a breach of the Privacy Policy. We do not sell, share or rent your personal information to any third party or send undesirable messages. Any text message sent by the Ministry of Transport will be for enabling the use of the App only.\n \n'
              'Disclaimer Notice\n'
              'Exclusions and Limitations\n'
              'The Ministry of Transport excludes all liability for damages arising out of or in connection with your use of this App. This includes, but is not limited to, direct loss, loss of business or profit (whether or not the loss of such profits was foreseeable, arose in the normal course of things), damages caused to cell phone systems and data thereon or any other direct or indirect, consequential and incidental damages. These exclusions and limitations apply only to the extent permitted by law, without affecting your legal rights.\n \n'
              'Access Range\n'
              'Unless otherwise specified, the services from this App are only available within the Sultanate of Oman. You are solely responsible for evaluating the fitness of any downloads, software, programmes and text available through this App. Redistribution or republication of any part of this App or its content is prohibited, without the express written consent of the Ministry of Transport. The Ministry of Transport does not warrant that the service from this App will be timely or error free, although it is provided to the best ability.\n \n'
              'Copyrights\n'
              'Copyright and other intellectual property rights include all texts relating to the App of the Ministry of Transport and the entire contents of this App.\n \n'
              'Notification of Change\n'
              'The Ministry of Transport reserves the right to change these Terms and Conditions from time to time as it sees fit and continued use of this App will signify your acceptance of any adjustment to these Terms. If there are any changes to our Privacy Policy and/or the Terms and Conditions, we will announce that these changes have been made on our App. If there are any changes in how we use the personal information of our beneficiaries, notifications by text message to those affected by this change. You are therefore advised to re-read and review this statement on a regular basis.\n \n'
              'Your browsing of this App and your use of its services indicates your understanding, agreement to and acceptance of the Disclaimer Notice and all the Terms and Conditions contained herein.\n \n')))
      .show();
}
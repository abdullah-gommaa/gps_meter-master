import 'package:flutter/material.dart';
import 'package:gpsmeter/core/viewmodel/otp_view_model.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:gpsmeter/ui/translations/otp.i18n.dart';


class OTPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OTPFields data = ModalRoute.of(context).settings.arguments;
    return ChangeNotifierProvider<OTPModel>(
      create: (_) => OTPModel(),
      child: Consumer<OTPModel>(
        builder: (context, provider, child) => Scaffold(
          key: Provider.of<OTPModel>(context).scaffoldKey,
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(238, 238, 221, 100),
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 30),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Phone Number Verification'.i18n,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 8),
                      child: RichText(
                        text: TextSpan(
                            text: "Enter the code sent to ".i18n,
                            children: [
                              TextSpan(
                                  text: data.phoneNumber,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ],
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
                        child: PinCodeTextField(
                          length: 4,
                          obsecureText: false,
                          animationType: AnimationType.fade,
                          shape: PinCodeFieldShape.box,
                          animationDuration: Duration(milliseconds: 300),
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          backgroundColor: Color.fromRGBO(238, 238, 221, 100),
                          fieldWidth: 40,
                          inactiveColor: Color.fromRGBO(162, 132, 94, 1),
                          activeFillColor: Colors.white,
                          enableActiveFill: true,
                          errorAnimationController: Provider.of<OTPModel>(context).errorController,
                          controller: Provider.of<OTPModel>(context).textEditingController,
                          onChanged: (value) {
                            Provider.of<OTPModel>(context, listen: false).onChangedField(value);
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        Provider.of<OTPModel>(context).hasError
                            ? "*Please fill up all the cells".i18n
                            : "",
                        style:
                            TextStyle(color: Colors.red.shade300, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "Didn't receive the code? ".i18n,
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                          children: [
                            TextSpan(
                                text: " RESEND".i18n,
                                style: TextStyle(
                                    color: Color(0xFF91D3B3),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))
                          ]),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 30),
                      child: ButtonTheme(
                        height: 50,
                        child: FlatButton(
                          onPressed: () {
                            Provider.of<OTPModel>(context, listen: false).verify(context, data.otp);
                          },
                          child: Center(
                              child: Text(
                            "Verify".i18n,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(162, 132, 94, 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

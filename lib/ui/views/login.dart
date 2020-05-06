import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpsmeter/ui/shared/sizeconfig.dart';
import 'package:gpsmeter/core/viewmodel/login_view_model.dart';
import 'package:provider/provider.dart';
import 'package:gpsmeter/ui/translations/login.i18n.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(),
      child: Scaffold(
          body: Container(
              color: Color.fromRGBO(158, 131, 95, 0.21),
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: Consumer<LoginModel>(
                    builder: (context, provider, child) => Form(
                      key: Provider.of<LoginModel>(context).formKey(),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage('assets/ic_login.png'),
                              width: SizeConfig.safeBlockHorizontal * 80,
                              height: SizeConfig.safeBlockVertical * 20,
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical * 5,
                            ),
                            TextFormField(
                              maxLength: 8,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              enabled:
                                  !Provider.of<LoginModel>(context).isRunning,
                              controller: Provider.of<LoginModel>(context)
                                  .phoneNumberController,
                              validator: Provider.of<LoginModel>(context)
                                  .validatePhoneNumber,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  labelText: 'Phone Number'.i18n,
                                  hintText: 'Phone Number'.i18n,
                                  prefixIcon: Icon(Icons.phone)),
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical * 3,
                            ),
                            ButtonTheme(
                                child: RaisedButton(
                              color: Color.fromRGBO(162, 132, 94, 1),
                              onPressed: Provider.of<LoginModel>(context).sendOTP(context),
                              child: Text(
                                'Send OTP'.i18n,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )),
                            Text(Provider.of<LoginModel>(context)
                                .getErrorMessage(context))
                          ]),
                    ),
                  )))),
    );
  }
}

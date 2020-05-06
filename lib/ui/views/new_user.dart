import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpsmeter/ui/shared/sizeconfig.dart';
import 'package:gpsmeter/core/viewmodel/new_user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:gpsmeter/ui/translations/new_user.i18n.dart';

class NewUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ChangeNotifierProvider<NewUserModel>(
        create: (_) => NewUserModel(),
        child: Scaffold(
          body: Container(
            color: Color.fromRGBO(158, 131, 95, 0.21),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Consumer<NewUserModel>(
                builder: (context, provider, child) => Form(
                  key: Provider.of<NewUserModel>(context).formKey(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/ic_register.png'),
                        width: SizeConfig.safeBlockHorizontal * 80,
                        height: SizeConfig.safeBlockVertical * 20,
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 5,
                      ),
                      TextFormField(
                        enabled: !Provider.of<NewUserModel>(context).isRunning,
                        keyboardType: TextInputType.number,
                        maxLength: 12,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        controller: Provider.of<NewUserModel>(context)
                            .civilIdController,
                        validator:
                            Provider.of<NewUserModel>(context).isEmptyValidator,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            labelText: 'Civil ID'.i18n,
                            hintText: 'Civil ID'.i18n,
                            counter: Text(""),
                            prefixIcon: Icon(Icons.perm_identity)),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 2,
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: TextFormField(
                              enabled:
                                  !Provider.of<NewUserModel>(context).isRunning,
                              keyboardType: TextInputType.text,
                              maxLength: 2,
                              validator: Provider.of<NewUserModel>(context)
                                  .isEmptyValidator,
                              inputFormatters: [
                                WhitelistingTextInputFormatter(RegExp("[A-Z]"))
                              ],
                              controller: Provider.of<NewUserModel>(context)
                                  .plateCodeController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  counter: Text(""),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  labelText: 'Plate Code'.i18n,
                                  hintText: 'Plate Code'.i18n,
                                  prefixIcon: Icon(Icons.directions_car)),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 2,
                          ),
                          Flexible(
                            child: TextFormField(
                              enabled:
                                  !Provider.of<NewUserModel>(context).isRunning,
                              keyboardType: TextInputType.number,
                              maxLength: 5,
                              validator: Provider.of<NewUserModel>(context)
                                  .isEmptyValidator,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              controller: Provider.of<NewUserModel>(context)
                                  .plateNumberController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                counter: Text(""),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                labelText: 'Plate Number'.i18n,
                                hintText: 'Plate Number'.i18n,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 2,
                      ),
                      TextFormField(
                        enabled: !Provider.of<NewUserModel>(context).isRunning,
                        keyboardType: TextInputType.number,
                        maxLength: 8,
                        validator:
                            Provider.of<NewUserModel>(context).isEmptyValidator,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        controller: Provider.of<NewUserModel>(context)
                            .phoneNumberController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            counter: Text(""),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            labelText: 'Phone Number'.i18n,
                            hintText: 'Phone Number'.i18n,
                            prefixIcon: Icon(Icons.phone)),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 3,
                      ),
                      CheckboxListTile(
                          title: Text(
                              'I agree to Terms of Service, and Prviacy Policy'
                                  .i18n),
                          value: Provider.of<NewUserModel>(context)
                              .isAcceptedTerms,
                          onChanged: (bool value) async {
                            Provider.of<NewUserModel>(context, listen: false).termsAndConditionAndPrivacy(context, 'Next'.i18n, 'Accept'.i18n, 'Decline'.i18n);
                          }),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 3,
                      ),
                      ButtonTheme(
                          child: RaisedButton(
                        color: Color.fromRGBO(162, 132, 94, 1),
                        onPressed: Provider.of<NewUserModel>(context)
                            .sendRegister(context),
                        child: Text(
                          'Register'.i18n,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 1,
                      ),
                      Text(Provider.of<NewUserModel>(context)
                          .getErrorMessage(context))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

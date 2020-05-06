import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpsmeter/ui/shared/sizeconfig.dart';
import 'package:gpsmeter/ui/translations/greeting.i18n.dart';

class GreetingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/ic_splash.png'),
                    fit: BoxFit.cover)),
          ),
          Container(
            color: Color.fromRGBO(158, 131, 95, 0.65),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/ic_app_logo.png'),
                  width: SizeConfig.safeBlockHorizontal * 80,
                  height: SizeConfig.safeBlockVertical * 30,
                ),
                Text('The Smart App for calculating taxi fare'.i18n,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: SizeConfig.safeBlockVertical * 5),
                ButtonTheme(
                  height: SizeConfig.safeBlockVertical * 5,
                  minWidth: SizeConfig.safeBlockHorizontal * 80,
                  child: RaisedButton(
                    color: Colors.white,
                      child:
                          Text('Log In'.i18n, style: TextStyle(color: Color.fromRGBO(162, 132, 94, 1))),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/login');
                      }),
                ),
                ButtonTheme(
                  height: SizeConfig.safeBlockVertical * 5,
                  minWidth: SizeConfig.safeBlockHorizontal * 80,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Text(
                      'New User'.i18n,
                      style: TextStyle(color: Color.fromRGBO(162, 132, 94, 1))
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/newuser');
                    },
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 25),
                Image(
                  image: AssetImage('assets/ic_motc.png'),
                  width: SizeConfig.safeBlockHorizontal * 80,
                  height: SizeConfig.safeBlockVertical * 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

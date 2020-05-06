import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gpsmeter/core/viewmodel/drawer_view_model.dart';
import 'package:gpsmeter/ui/widgets/terms_and_conditions.dart';
import 'package:gpsmeter/ui/widgets/privacy_policy.dart';
import 'package:gpsmeter/ui/translations/drawer.i18n.dart';

class LoggedInDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoggedInDrawerModel>(
        create: (_) => LoggedInDrawerModel(),
        child: Consumer<LoggedInDrawerModel>(
          builder: (context, provider, child) => Drawer(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      UserAccountsDrawerHeader(
                        accountName: Text(Provider.of<LoggedInDrawerModel>(context).getName(context)),
                        currentAccountPicture: Image.asset('assets/ic_profile.png'),
                        accountEmail: Text(Provider.of<LoggedInDrawerModel>(context).getVehicle()),
                      ),
                      ListTile(
                        title: Text('Trip'.i18n),
                        trailing: Icon(Icons.directions_car),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/trip');
                        },
                      ),
                      Divider(),
                      ListTile(
                        title: Text('History'.i18n),
                        trailing: Icon(Icons.history),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/history');
                        },
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Profile'.i18n),
                        trailing: Icon(Icons.perm_identity),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/profile');
                        },
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Log Out'.i18n),
                        trailing: Icon(Icons.exit_to_app),
                        onTap: () {
                          Provider.of<LoggedInDrawerModel>(context,
                                  listen: false)
                              .Logout(context);
                        },
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ListTile(
                      title: Text('Terms & Conditions'.i18n),
                      onTap: () {
                        termsAndConditions(context, null);
                      }
                    ),
                    ListTile(
                        title: Text('Privacy Policy'.i18n),
                        onTap: () {
                          privacyPolicy(context, null);
                        })
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

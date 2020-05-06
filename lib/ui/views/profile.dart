import 'package:flutter/material.dart';
import 'package:gpsmeter/ui/shared/sizeconfig.dart';
import 'package:gpsmeter/core/viewmodel/profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:gpsmeter/ui/widgets/drawer.dart';
import 'package:gpsmeter/ui/translations/profile.i18n.dart';

class ProfilePage extends StatelessWidget {
  Container labelAndValue(String label, String value, double width,
      double height, double labelWidth, double labelHeight) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Color.fromRGBO(162, 132, 94, 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: Color.fromRGBO(162, 132, 94, 1),
        ),
      ),
      width: width,
      height: height,
      //color: Color.fromRGBO(162, 132, 94, 1),
      child: Column(
        children: <Widget>[
          Container(
              width: labelWidth,
              height: labelHeight,
              child: Text(
                label,
                style: TextStyle(color: Colors.white),
              )),
          Container(
              width: labelWidth,
              height: labelHeight,
              child: Text(value, style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ChangeNotifierProvider<ProfileModel>(
      create: (_) => ProfileModel(),
      child: Scaffold(
        drawer: LoggedInDrawer(),
        appBar: AppBar(
          title: Text('Profile'.i18n),
        ),
        body: Container(
          height: SizeConfig.screenHeight * 100,
          width: SizeConfig.screenWidth * 100,
          color: Color.fromRGBO(158, 131, 95, 0.21),
          child: Container(
            child: Consumer<ProfileModel>(
                builder: (context, provider, child) => Column(
                      children: <Widget>[
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 5,
                        ),
                        Image(
                          image: AssetImage('assets/ic_profile.png'),
                          width: SizeConfig.safeBlockHorizontal * 80,
                          height: SizeConfig.safeBlockVertical * 20,
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 5,
                        ),
                        Card(
                          color: Color.fromRGBO(162, 132, 94, 1),
                          child: ListTile(
                            title: Text(Provider.of<ProfileModel>(context)
                                .getCivilId(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                            subtitle: Text('Civil ID'.i18n, style: TextStyle(color: Colors.white),),
                            trailing: Icon(Icons.confirmation_number),
                          ),
                        ),
                        Card(
                          color: Color.fromRGBO(162, 132, 94, 1),
                          child: ListTile(
                            title: Text(Provider.of<ProfileModel>(context)
                                .getName(context), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                            subtitle: Text('Name'.i18n, style: TextStyle(color: Colors.white),),
                            trailing: Icon(Icons.perm_identity),
                          ),
                        ),
                        Card(
                          color: Color.fromRGBO(162, 132, 94, 1),
                          child: ListTile(
                            title: Text(Provider.of<ProfileModel>(context)
                                .getPhoneNumber(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                            subtitle: Text('Phone Number'.i18n, style: TextStyle(color: Colors.white),),
                            trailing: Icon(Icons.phone_android),
                          ),
                        ),
                        Card(
                          color: Color.fromRGBO(162, 132, 94, 1),
                          child: ListTile(
                            title: Text(Provider.of<ProfileModel>(context)
                                .getVehicle(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                            subtitle: Text('Vehicle Plate Number & Code'.i18n, style: TextStyle(color: Colors.white),),
                            trailing: Icon(Icons.directions_car),
                          ),
                        ),
                      ],
                    )),
          ),
        ),
      ),
    );
  }
}

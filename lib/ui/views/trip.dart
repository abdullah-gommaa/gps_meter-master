import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpsmeter/ui/shared/sizeconfig.dart';
import 'package:provider/provider.dart';
import 'package:gpsmeter/core/viewmodel/trip_viewmodel.dart';
import 'package:gpsmeter/ui/widgets/drawer.dart';
import 'package:gpsmeter/ui/translations/trip.i18n.dart';

class TripPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ChangeNotifierProvider<TripModel>(
      create: (_) => TripModel(),
      child: Scaffold(
        drawer: LoggedInDrawer(),
        appBar: AppBar(
          title: Text('Trip'.i18n),
        ),
        body: Consumer<TripModel>(
            builder: (context, provider, child) => Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Stack(
                          children: <Widget>[
                            GoogleMap(
                              zoomControlsEnabled: false,
                              mapToolbarEnabled: false,
                              initialCameraPosition:
                                  Provider.of<TripModel>(context)
                                      .beforeRunningPosition,
                              onMapCreated:
                                  Provider.of<TripModel>(context).onMapCreated,
                              markers: Set<Marker>.of(
                                  Provider.of<TripModel>(context)
                                      .markers
                                      .values),
                              polylines: Set<Polyline>.of(
                                  Provider.of<TripModel>(context)
                                      .polyLines
                                      .values),
                            ),
                            Positioned(
                              right: 50,
                              left: 50,
                              height: SizeConfig.safeBlockVertical * 10,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Color.fromRGBO(172, 140, 86, 1)),
                                    borderRadius:
                                    BorderRadius.only(
                                     bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                    )),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(Provider.of<TripModel>(context).getPrice()),
                                    Text('OMR')
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 40,
                              right: 40,
                              left: 40,
                              child: Container(
                                width: SizeConfig.safeBlockHorizontal * 45,
                                height: SizeConfig.safeBlockVertical * 10,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(172, 140, 86, 1),
                                  borderRadius: BorderRadius.all(Radius.circular(10)
                                  )
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(Provider.of<TripModel>(context).getTotalDistance()),
                                      Text('km')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              right: 20,
                              bottom: 80,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Color.fromRGBO(172, 140, 86, 1)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text('Total Time:'),
                                          Text(Provider.of<TripModel>(context)
                                              .getDuration())
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text('Waiting Time:'),
                                          Text(Provider.of<TripModel>(context)
                                              .getWaitingTime())
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 80,
                              right: 150,
                              left: 150,
                              height: SizeConfig.safeBlockVertical * 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(
                                  color: Color.fromRGBO(172, 140, 86, 1)),
                                  ),
                                  child: InkWell(
                                      child: Center(
                                        child: Text(Provider.of<TripModel>(context)
                                        .buttonText
                                        .i18n),
                                      ),
                                  onTap: () {
                                  Provider.of<TripModel>(context, listen: false)
                                      .buttonClick();
                                  },
                                  ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
      ),
    );
  }
}

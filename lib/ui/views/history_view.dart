// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs



import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpsmeter/core/model/trip.dart';
import 'package:gpsmeter/core/viewmodel/history_view_view_model.dart';
import 'package:provider/provider.dart';


class HistoryViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Trip trip = ModalRoute.of(context).settings.arguments;
    return ChangeNotifierProvider<HistoryViewModel>(
        create: (_) => HistoryViewModel(trip.id),
        child: Scaffold(
          body: Consumer<HistoryViewModel>(
              builder: (context, provider, child) =>
                  Provider.of<HistoryViewModel>(context).isLoading
                      ? CircularProgressIndicator()
                      : Stack(
                          children: <Widget>[
                            GoogleMap(
                              initialCameraPosition: CameraPosition(
                                  zoom: 10,
                                  target: Provider.of<HistoryViewModel>(context)
                                      .getStartPosition()),
                              polylines: Set<Polyline>.of(
                                  Provider.of<HistoryViewModel>(context)
                                      .polylines
                                      .values),
                              onMapCreated:
                                  Provider.of<HistoryViewModel>(context)
                                      .onMapCreated,
                            )
                          ],
                        )),
        ));
  }
}

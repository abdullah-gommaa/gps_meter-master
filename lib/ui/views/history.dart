import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gpsmeter/ui/shared/sizeconfig.dart';
import 'package:gpsmeter/ui/widgets/drawer.dart';
import 'package:gpsmeter/core/viewmodel/history_view_model.dart';
import 'package:gpsmeter/ui/translations/history.i18n.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ChangeNotifierProvider<HistoryModel>(
        create: (_) => HistoryModel(),
        child: Scaffold(
            drawer: LoggedInDrawer(),
            appBar: AppBar(
              title: Text('History'.i18n),
            ),
            body: Container(
                height: SizeConfig.screenHeight * 100,
                width: SizeConfig.screenWidth * 100,
                color: Color.fromRGBO(158, 131, 95, 0.21),
                child: Consumer<HistoryModel>(
                  builder: (context, provider, child) => SafeArea(
                    child: Provider.of<HistoryModel>(context).isLoading
                        ? Center(child: CircularProgressIndicator())
                        : Provider.of<HistoryModel>(context).trips.isEmpty
                            ? Center(child: Text('No Trips recorded'.i18n))
                            : ListView.builder(
                                itemCount: Provider.of<HistoryModel>(context)
                                    .trips
                                    .length,
                                itemBuilder: (context, index) => Card(
                                  child: ListTile(
                                    onTap: (){
                                      Navigator.pushNamed(context, '/history/view', arguments: Provider.of<HistoryModel>(context, listen: false).trips[index]);
                                    },
                                    title: Text(Provider.of<HistoryModel>(context).trips[index].price.toStringAsFixed(3) + ' OMR'.i18n),
                                    subtitle: Text('Starting Time: '.i18n + Provider.of<HistoryModel>(context).startTime(index)),
                                    trailing: Icon(Icons.more_vert),
                                  ),
                                )
                    ),
                  ),
                ))));
  }
}

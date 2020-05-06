import 'package:flutter/material.dart';
import 'package:gpsmeter/ui/views/greeting.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gpsmeter/getit.dart';
import 'package:gpsmeter/ui/views/new_user.dart';
import 'package:gpsmeter/ui/views/login.dart';
import 'package:gpsmeter/ui/views/trip.dart';
import 'package:gpsmeter/ui/views/profile.dart';
import 'package:gpsmeter/ui/views/history.dart';
import 'package:gpsmeter/ui/views/otp.dart';
import 'package:gpsmeter/ui/views/history_view.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('en'), const Locale('ar')],
      title: 'Abir',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      routes: {
        '/greeting': (context) => GreetingPage(),
        '/newuser': (context) => NewUserPage(),
        '/login': (context) => LoginPage(),
        '/trip': (context) => TripPage(),
        '/profile': (context) => ProfilePage(),
        '/history': (context) => HistoryPage(),
        '/otp': (context) => OTPPage(),
        '/history/view': (context) => HistoryViewPage()
      },
      home: I18n(child: GreetingPage()),
      builder: (context, navigator) {
        var lang = Localizations.localeOf(context).languageCode;

        return Theme(
          data: ThemeData(
            primaryColor: Color.fromRGBO(172, 140, 86, 1),
            primarySwatch: Colors.brown,
            textTheme: Theme.of(context).textTheme.apply(
                fontFamily: lang == 'ar'?
                'ArabicFamily' : 'EnglishFamily',
                fontSizeDelta: lang == 'ar'? 2.0 : 0.0
            ),
          ),
          child: navigator,
        );
      },
    );
  }
}

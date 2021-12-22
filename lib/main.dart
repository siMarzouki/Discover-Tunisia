import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/destination_screen.dart';
import 'screens/details_screen.dart';
import 'screens/about_the_app_screen.dart';
import 'screens/home_screen.dart';
import 'data/app_localizattions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Discover Tunisia',
        supportedLocales: const [
          Locale("en", ''),
          Locale("fr", ''),
          Locale("de", "")
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        theme: ThemeData(
            primaryColor: Colors.black,
            primaryTextTheme: const TextTheme(
                headline5: TextStyle(color: Colors.cyan),
                headline6: TextStyle(color: Colors.cyan))),
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          DestinationScreen.routeName: (context) => const DestinationScreen(),
          DetailsScreen.routeName: (context) => const DetailsScreen(),
          AboutTheAppScreen.routeName: (context) => const AboutTheAppScreen()
        },
        home: const HomeScreen());
  }
}

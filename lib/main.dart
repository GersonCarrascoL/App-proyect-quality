import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:caliproy/module/login/login_view.dart';
import 'package:caliproy/module/registration/registration_view.dart';
import 'package:caliproy/module/searchmap/searchmap_view.dart';
import 'package:caliproy/config/config.dart';
import 'package:caliproy/colors.dart';

var myKey = API_KEY_MAPS;

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  final String _appTitle = 'Calidad proyecto';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return new MaterialApp(
      title: this._appTitle,
      theme: _themeBuild,
      home: new LoginPage(title: 'Flutter Demo Home Page'),
      routes: <String,WidgetBuilder>{
        '/login': (BuildContext context) => new LoginPage(),
        '/register': (BuildContext context) => new RegistrationPage(),
        '/mainmap': (BuildContext context) => new MainMapPage()
      },
    );
  }
}

final ThemeData _themeBuild = _buildThemeData();
ThemeData _buildThemeData(){
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: tprimaryColor,
    accentColor: toptionalColor,
    scaffoldBackgroundColor: tbackgroundColor,
    cardColor: tbackgroundColor,
    buttonColor: taccentColor,
    errorColor: tErrorRed,
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
    hintColor:Colors.grey,
  );  
}

TextTheme _buildTextTheme(TextTheme base){
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
        fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: tColorTextPrimary,
    bodyColor: tColorTextPrimary,
  );
}
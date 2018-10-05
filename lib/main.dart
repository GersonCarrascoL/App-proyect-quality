import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:map_view/map_view.dart';
import 'colors.dart';
import 'registration.dart';
import 'viewmap.dart';

var myKey = 'AIzaSyAohyz0ihWkHkPgQXCk1iNr72QHol0uSbQ';

void main() {
  // MapView.setApiKey(myKey);
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

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _visibilityPassword = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: new EdgeInsets.all(15.0),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors:[ tprimaryColor,toptionalColor],
            begin: FractionalOffset.topCenter,
            end:FractionalOffset.bottomCenter,
            stops:[0.0,1.0],
            tileMode:TileMode.clamp
          ),
        ),
        child: new Form(
          key: _formKey,
          autovalidate: true,
          child: new ListView(
            padding: new EdgeInsets.fromLTRB(40.0, 100.0, 40.0, 0.0),
            children: <Widget>[
              // new Image(
              //   image: new AssetImage("assets/images/book.png"),
              // ),

              new Container(
                // padding: new EdgeInsets.all(15.0),
                child: new TextFormField(
                  decoration: new InputDecoration(
                    icon: new Icon(Icons.person,color: toptionalColor),
                    hintText: 'Email',
                    // contentPadding: const EdgeInsets.all(18.0),
                    // hintStyle: TextStyle(color:Colors.grey),
                  ),
                  keyboardType: TextInputType.emailAddress
                )
              ),

              new Container(
                // padding: new EdgeInsets.all(15.0),
                child: new TextFormField(
                  decoration: new InputDecoration(
                    icon: new Icon(Icons.lock,color:toptionalColor),
                    suffixIcon: IconButton(
                      icon: _visibilityPassword? Icon(Icons.visibility_off): Icon(Icons.visibility),
                      onPressed:(){
                        setState(() {
                          _visibilityPassword = !_visibilityPassword;
                          _obscureText = !_obscureText;
                        });
                      } ,
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(color:Colors.white)
                  ),
                  validator: (val) => val.length<6 ? "Password too short" : null,
                  obscureText: _obscureText,
                )
              ),
              
              new Container(
                // padding: new EdgeInsets.only(left:60.0,right: 60.0),
                child: 
                  new RaisedButton(
                    child: new Text('INGRESAR',style:new TextStyle(color:tbackgroundColor,fontSize: 20.0)),
                    padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                    onPressed: (){
                      Navigator.of(context).pushNamed('/mainmap');
                    },
                    // shape: new RoundedRectangleBorder(borderRadius:new BorderRadius.circular(20.0)),
                  ),
                margin: EdgeInsets.only(top: 20.0),
                
              ),
              new Container(
                // padding: new EdgeInsets.only(left:60.0,right: 60.0),
                child: 
                  new RaisedButton(
                    child: new Text('REGÍSTRATE',style:new TextStyle(color:tbackgroundColor,fontSize: 20.0)),
                    padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                    // shape: new RoundedRectangleBorder(borderRadius:new BorderRadius.circular(20.0)),
                  ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ]
          ),
        ),
	    )
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
    hintColor: tbackgroundColor,
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
    displayColor: tbackgroundColor,
    bodyColor: tbackgroundColor,
  );
}
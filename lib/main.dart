import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(new MyApp());
    });
  // runApp(new MyApp());
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
      theme: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        buttonColor: Colors.purple,
        errorColor: Colors.blue,
        hintColor: Colors.white,
        // inputDecorationTheme: new InputDecorationTheme(
        //   border: OutlineInputBorder(
        //     borderRadius: new BorderRadius.all(Radius.circular(0.0)),
        //   ),
        //   fillColor: Colors.white,
        //   filled:true
        // ), 
      ),
      home: new LoginPage(title: 'Flutter Demo Home Page'),
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
  final _titleBar = 'Log In';


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors:[ const Color(0xFF00796B),const Color(0xFF00BCD4)],
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
              new Image(
                image: new AssetImage("assets/images/book.png"),
              ),

              new Container(
                padding: new EdgeInsets.all(15.0),
                child: new TextFormField(
                    decoration: const InputDecoration(
                    hintText: 'Email',
                    contentPadding: const EdgeInsets.all(18.0),
                    hintStyle: TextStyle(color:Colors.grey),
                  ),
                  keyboardType: TextInputType.emailAddress
                )
              ),

              new Container(
                padding: new EdgeInsets.all(15.0),
                child: new TextFormField(
                  decoration: InputDecoration(
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
                      hintStyle: TextStyle(color:Colors.grey),
                      contentPadding: const EdgeInsets.all(18.0)
                    ),
                    validator: (val) => val.length<6 ? "Password too short" : null,
                    obscureText: _obscureText,
                )
              ),
              
              new Container(
                padding: new EdgeInsets.all(10.0),
                child: 
                  new RaisedButton(
                    child: new Text('Ingresar',style:new TextStyle(color:Colors.white,fontSize: 20.0)),
                    padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                    onPressed: ()=> null,
                  ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              new Center(
                child: new RichText(
                  text: new TextSpan(
                    children:[
                      new TextSpan(
                        text: 'Aún no te registras? '
                      ),
                      new TextSpan(
                        text: 'Registrate',
                      )
                    ]
                  ),
                ),
              )
            ]
          ),
        ),
	    )
    );
  }
}

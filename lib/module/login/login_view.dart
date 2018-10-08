import 'package:flutter/material.dart';
import 'package:caliproy/colors.dart';

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
  bool _autoValidate = false;
  // VARIABLES
  String _email;
  String _password;
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
        child:new Container(
          alignment: Alignment.topCenter,
            padding: new EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .2,
                right: 20.0,
                left: 20.0),
            child: new Container(
              height: MediaQuery.of(context).size.height* .6,
              width: MediaQuery.of(context).size.width,
              child: new Card(
                child: formUI(),
                color: Colors.white,
                elevation: 4.0,
              ),
            ),
        ),
	    )
    );
  }


  Widget formUI(){
    return new Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: new ListView(
        padding: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        children: <Widget>[

          new Container(
            child: new TextFormField(
              decoration: new InputDecoration(
                labelText: 'Email',
                labelStyle: new TextStyle( color: Colors.grey),
                icon: new Icon(Icons.person,color: toptionalColor)
              ),
              keyboardType: TextInputType.emailAddress,
              validator: validateEmail,
              onSaved: (String val){
                _email = val;
              },
            )
          ),

          new Container(

            child: new TextFormField(
              decoration: new InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color:Colors.grey),
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
              ),
              obscureText: _obscureText,
              validator: validatePassword,
              onSaved: (String val){
                _password = val;
              }
            )
          ),
          
          new Container(
            child: 
              new RaisedButton(
                child: new Text('INGRESAR',style:new TextStyle(color:tbackgroundColor,fontSize: 20.0)),
                padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                onPressed: _validateInputs
              ),
            margin: EdgeInsets.only(top: 20.0),
            
          ),
          new Container(
            
            child: 
              new RaisedButton(
                child: new Text('REGÍSTRATE',style:new TextStyle(color:tbackgroundColor,fontSize: 20.0)),
                padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                onPressed: (){
                  Navigator.of(context).pushNamed('/register');
                }
              ),
            margin: EdgeInsets.only(top: 20.0),
          ),
        ]
      ),
    );
  }

  String validateEmail(String value){
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Ingresar un email válido';
    else
      return null;
  }

  String validatePassword(String value){
    if(value.length<6)
      return "Password too short";
    else
      return null;  
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      Navigator.of(context).pushNamed('/mainmap');
      print("Validado");
      _formKey.currentState.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}


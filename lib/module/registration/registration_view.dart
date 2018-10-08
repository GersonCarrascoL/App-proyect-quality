import 'package:flutter/material.dart';
import 'package:caliproy/colors.dart';

class RegistrationPage extends StatefulWidget{
  _RegistrationState createState() => new _RegistrationState();
}

class _RegistrationState extends State<RegistrationPage>{
  final _titleBar = 'Registro';

  String selDistrict;
  String selOcupation;
  String selEducationGrade;
  String selSex;

  @override
  Widget build(BuildContext context) {
    return new  Scaffold(
      appBar: new AppBar(
        title: new Text(_titleBar,style:new TextStyle(color:Colors.white),),
        centerTitle: true,
      ),
      body: new Container(
        decoration: new BoxDecoration(
        ),
        padding: new EdgeInsets.only(top: 15.0,left: 40.0,right: 40.0),
        child: new Form(
          child: ListView(
            children: <Widget>[
              new TextFormField(
                decoration: InputDecoration(
                  icon: new Icon(Icons.person,color: toptionalColor ),
                  hintText: 'Nombres'
                ),
              ),
              new TextFormField(
                decoration: InputDecoration(
                  icon: new Icon(Icons.email, color: toptionalColor),
                  hintText: 'Apellidos'
                ),
              ),
              new TextFormField(
                decoration: InputDecoration(
                  icon: new Icon(Icons.email, color: toptionalColor),
                  hintText: 'Correo'
                ),
              ),
              new TextFormField(
                decoration: InputDecoration(
                  icon: new Icon(Icons.email, color: toptionalColor),
                  hintText: 'Nombre de usuario'
                ),
              ),
              new TextFormField(
                decoration: InputDecoration(
                  icon: new Icon(Icons.vpn_key, color: toptionalColor),
                  hintText: 'Contraseña'
                ),
              ),
              new TextFormField(
                decoration: InputDecoration(
                  icon: new Icon(Icons.email, color: toptionalColor),
                  hintText: 'DNI'
                ),
              ),
              new Row(
                children:<Widget>[
                  new Expanded(
                    child:new Text('Sexo')
                  ),
                  new DropdownButton(
                    items:<String>['M','F'].map((String value){
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value)
                      );
                    }).toList(),
                    value: selSex,
                    hint: new Text('Selecciona opción'),
                    onChanged: (value){
                      selSex = value;
                      setState((){
                      });
                    },
                  ),
                ]
              ),
              
              new Row(
                children: <Widget>[
                  new Expanded(
                    child:new Text('Distrito')
                  ),
                  new DropdownButton(
                    items:<String>['Lima','Callao'].map((String value){
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    hint:new Text('Selecciona opción'),
                    value: selDistrict,
                    onChanged: (value){
                      print("Seleccionado $value");
                      selDistrict = value;
                      setState(() {             
                      });
                    },
                    
                  ),
                ],
              ),
               new Row(
                children: <Widget>[
                  new Expanded(
                    child:new Text('Ocupacion')
                  ),
                  new DropdownButton(
                    items:<String>['Estudiante','Profesor'].map((String value){
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    value: selOcupation,
                    hint: new Text('Selecciona opción'),
                    onChanged: (value){
                      selOcupation = value;
                      setState((){
                      });
                    },
                  ),
                ],
              ),
               new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Text('Grado Educativo')
                  ),
                  
                    new DropdownButton(
                      items:<String>['Primaria','Secundaria'].map((String value){
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      value:selEducationGrade,
                      hint: new Text('Selecciona opción'),
                      onChanged: (value){
                        selEducationGrade = value;
                        setState((){
                        });
                      },
                    ),
                  
                ],
              ),
              new Container(
                child:new RaisedButton(
                  child: new Text('REGISTRAR',style:new TextStyle(color:Colors.white,fontSize: 20.0)),
                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                  onPressed:(){
                    Navigator.of(context).pop(true);
                  },
                )
              )
            ],
          ),
        )
      ),
    );
  }


}
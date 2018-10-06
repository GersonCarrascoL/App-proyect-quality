import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// var myKey = 'AIzaSyAohyz0ihWkHkPgQXCk1iNr72QHol0uSbQ';
class MainMapPage extends StatefulWidget{
  @override
  _MainMapPageSate createState() => new _MainMapPageSate();
}

class _MainMapPageSate extends State<MainMapPage>{
  final TextEditingController _filter = new TextEditingController();
  final dio = new Dio();
  String _searchText = "";
  List names = new List();
  List filteredNames = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appTitleBar = new Text('Search');
  
  GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: new Stack(
          children: <Widget>[
          new GoogleMap(
            onMapCreated:_onMapCreated
          ),
          new Container(
            alignment: Alignment.topCenter,
            padding: new EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .5,
                right: 20.0,
                left: 20.0),
            child: new Container(
              height: 80.0,
              width: MediaQuery.of(context).size.width,
              child: new Card(
                child: new TextField(),
                color: Colors.red,
                elevation: 4.0,
              ),
            ),
          )
        ],
      )
    );
  }

  /* ///////////////FUNCTIONS MAPS/////////////// */
  void _onMapCreated(GoogleMapController controller) {
    setState(() { mapController = controller; });
  }

  /* ///////////////FUNCTIONS SEARCH BAR/////////////// */
  void _getNamesApi() async{
    final response = await dio.get('https://swapi.co/api/people');
    List tempList = new List();

    for (var i = 0; i < response.data['results'] ; i++) {
      tempList.add(response.data['results'][i]);
    }

    setState(() {
          names = tempList;
          filteredNames = names;
        });
  }
}
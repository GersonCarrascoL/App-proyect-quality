import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

// var myKey = 'AIzaSyAohyz0ihWkHkPgQXCk1iNr72QHol0uSbQ';
class MainMapPage extends StatefulWidget{
  @override
  _MainMapPageSate createState() => new _MainMapPageSate();
}

class _MainMapPageSate extends State<MainMapPage>{
  GoogleMapController mapController;

  // displayMap(){
  //   mapView.show(new MapOptions(
  //     mapViewType: MapViewType.normal,
  //     initialCameraPosition: new CameraPosition(
  //       new Location(35.22, -101.83), 15.0),
  //     showUserLocation: true,
  //     title: 'Google Map'
  //   ));
  // }
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new GoogleMap(
          onMapCreated:_onMapCreated
        ),
        new Container(
          alignment: Alignment.topCenter,
          padding: new EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .58,
              right: 20.0,
              left: 20.0),
          child: new Container(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            child: new Card(
              color: Colors.white,
              elevation: 4.0,
            ),
          ),
        )
      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() { mapController = controller; });
  }
}
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMap extends StatefulWidget {
  GMap({Key key}) : super(key:key);
  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {

  Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;
  BitmapDescriptor _markerIcon;

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
  }

  void _setMarkerIcon() async{
    _markerIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), "assets/noodle_icon.png");
  }

  void _onMapCreated(GoogleMapController controller){
    _mapController = controller;
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("0"),
          position: LatLng(6.927079,79.861244),
          infoWindow: InfoWindow(
            title: "Colombo",
            snippet: "Sri Lanka",
          ),
          icon: _markerIcon,
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(6.927079,79.861244),
              zoom: 12,
            ),
            markers: _markers,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(0 , 0, 0, 32),
            child: Text(
              "Google Maps using Flutter",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
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
  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Polyline> _polylines = HashSet<Polyline>();
  Set<Circle> _circles = HashSet<Circle>();


  GoogleMapController _mapController;
  BitmapDescriptor _markerIcon;

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
    _setPolygon();
    _setPolylines();
    _setCircles();
  }

  void _setMarkerIcon() async{
    _markerIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), "assets/noodle_icon.png");
  }

  void _setCircles(){
    _circles.add(
      Circle(
        circleId: CircleId("0"),
        center: LatLng(7.291518,80.636796),
        radius: 1000,
        fillColor: Color.fromRGBO(102, 51, 153, 0.5),
      ),
    );
  }

  void _setPolylines(){
    List<LatLng> polygonLatLongs = List<LatLng>();
    polygonLatLongs.add(LatLng(7.291418,80.636696)); 
    polygonLatLongs.add(LatLng(7.053519,80.220978)); 
    polygonLatLongs.add(LatLng(7.872916,79.888634));    
    polygonLatLongs.add(LatLng(7.189464,79.858734)); 

    _polylines.add(Polyline(
      polylineId: PolylineId("0"),
      points: polygonLatLongs,
      color: Colors.red,
      width: 1,
    ));
  }

  void _setPolygon(){
    List<LatLng> polygonLatLongs = List<LatLng>();
    polygonLatLongs.add(LatLng(7.291418,80.636696)); //Kandy
    polygonLatLongs.add(LatLng(6.053519,80.220978)); //Galle
    polygonLatLongs.add(LatLng(6.872916,79.888634)); //Nugegoda    
    polygonLatLongs.add(LatLng(7.189464,79.858734)); //Negombo

    _polygons.add(Polygon(
      polygonId: PolygonId("0"),
      points: polygonLatLongs,
      fillColor: Colors.white,
      strokeWidth: 1,
    ));

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
            polygons: _polygons,
            polylines: _polylines,
            circles: _circles,
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
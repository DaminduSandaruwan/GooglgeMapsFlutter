import 'package:flutter/material.dart';
import 'package:google_maps/gmap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "GOOGLE MAP PACKAGE",
                style: TextStyle(
                  fontSize: 42,
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "This is the Menu",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.map),
        onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => GMap(),));
        },
      ),
    );
  }
}
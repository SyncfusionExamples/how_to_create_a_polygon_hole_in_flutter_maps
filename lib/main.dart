import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Maps Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Maps Polygon Hole Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<MapLatLng> _polygonPoints;

  @override
  void initState() {
    _polygonPoints = <MapLatLng>[
      MapLatLng(41.04621681452063, -104.0625),
      MapLatLng(41.04621681452063, -102.0849609375),
      MapLatLng(40.01078714046552, -102.041015625),
      MapLatLng(40.04443758460856, -95.44921875),
      MapLatLng(42.48830197960227, -96.3720703125),
      MapLatLng(43.03677585761058, -98.4375),
      MapLatLng(43.068887774169625, -104.0625),
      MapLatLng(41.04621681452063, -104.0625),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfMaps(
      layers: [
        MapTileLayer(
          initialZoomLevel: 4,
          initialFocalLatLng: MapLatLng(34.9709225,-100.2187212),
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          sublayers: [
            MapPolygonLayer.inverted(
              polygons: [
                MapPolygon(
                  points: _polygonPoints,
                )
              ].toSet(),
              color: Colors.black.withOpacity(0.5),
              strokeColor: Colors.purple,
              strokeWidth: 2.0,
            ),
          ],
        ),
      ],
    );
  }
}

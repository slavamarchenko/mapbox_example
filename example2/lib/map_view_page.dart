import 'package:flutter/material.dart';
import 'package:mapbox_gl_example/mb_map_view.dart';

class MapViewPage extends StatelessWidget {
  const MapViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MBMapView(

      ),
    );
  }
}

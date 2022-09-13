import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_gl_example/main.dart';
import 'package:maplibre_gl/mapbox_gl.dart';
import 'package:path_provider/path_provider.dart';

class MBMapView extends StatefulWidget {
  const MBMapView({Key? key}) : super(key: key);

  @override
  State<MBMapView> createState() => _MBMapViewState();
}

class _MBMapViewState extends State<MBMapView> {
  late Future<String> _getStyleFuture;

  @override
  void initState() {
    super.initState();

    _getStyleFuture =
        rootBundle.loadString(r'assets/bright.json').then((style) async {
      final tilesFile = File(
        (await getTemporaryDirectory()).path + r'/tiles.mbtiles',
      );
      final tilesBytes = await rootBundle.load(r'assets/planet.mbtiles');
      await tilesFile.writeAsBytes(tilesBytes.buffer.asInt8List(), flush: true);

      return style.replaceAll(
        r'___FILE_URI___',
        'mbtiles://${Uri.file(tilesFile.path)}',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: _getStyleFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text('Loading'),);
          }

          return MaplibreMap(
            initialCameraPosition: CameraPosition(
              //target: LatLng(13.198490219386255, 77.66066439357957),
              target: LatLng(28.261244899943616, 34.91058533420498),
              zoom: 10,
            ),
            styleString: snapshot.data,
            onMapCreated: (controller) {},
            //styleString: 'assets/style.json',
          );
        });
  }
}

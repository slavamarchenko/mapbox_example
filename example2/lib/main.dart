import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_gl_example/map_view_page.dart';
import 'package:path_provider/path_provider.dart';

class MapsDemo extends StatefulWidget {
  // static const String ACCESS_TOKEN = String.fromEnvironment("ACCESS_TOKEN");

  @override
  State<MapsDemo> createState() => _MapsDemoState();
}

class _MapsDemoState extends State<MapsDemo> {
  bool _ready = false;

  @override
  void initState() {
    super.initState();

    _initMap();
  }

  Future<void> _initMap() async {
    //MapboxMap.useHybridComposition = true;
    //await setOffline(true, accessToken: MapsDemo.ACCESS_TOKEN);

    //await installOfflineMapTiles('assets/saudi_arabia.mbtiles');

    setState(() {
      _ready = true;
    });
  }

  /// Determine the android version of the phone and turn off HybridComposition
  /// on older sdk versions to improve performance for these
  ///
  /// !!! Hybrid composition is currently broken do no use !!!
  // Future<void> initHybridComposition() async {
  //   if (Platform.isAndroid) {
  //     final androidInfo = await DeviceInfoPlugin().androidInfo;
  //     final sdkVersion = androidInfo.version.sdkInt;
  //     if (sdkVersion != null && sdkVersion >= 29) {
  //       MapboxMap.useHybridComposition = true;
  //     } else {
  //       MapboxMap.useHybridComposition = false;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MapboxMaps examples')),
      body: MapViewPage(),
    );
  }

  Widget buildAccessTokenWarning() {
    return Container(
      color: Colors.red[900],
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "Please pass in your access token with",
            "--dart-define=ACCESS_TOKEN=ADD_YOUR_TOKEN_HERE",
            "passed into flutter run or add it to args in vscode's launch.json",
          ]
              .map((text) => Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: MapsDemo()));
}

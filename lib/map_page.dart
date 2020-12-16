import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  // 初期位置の定義
  static final CameraPosition _kInitPosition = CameraPosition(
    target: LatLng(35.7100627, 139.8107004),
    zoom: 14.4746, // カメラのズーム
  );

  // 東京タワーの位置定義
  static final CameraPosition _toTokyoTowar = CameraPosition(
      bearing: 192.8334901395799, // 地図上辺を回転させる角度、時計方向に0-359(マイナス可)
      target: LatLng(35.6585805, 139.7432442),
      tilt: 59.440717697143555, // 地図とカメラの垂直の角度、0〜90度の範囲で指定します。
      zoom: 19.151926040649414 // カメラのズーム
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal, // GoogleMapのタイプを指定
        initialCameraPosition: _kInitPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      // ボタン定義
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTokyoTower,  //押下時の関数定義
        label: Text('To the Tokyo Tower!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  // ボタン押下時の関数定義
  Future<void> _goToTokyoTower() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_toTokyoTowar));
  }
}
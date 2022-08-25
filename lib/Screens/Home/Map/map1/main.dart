import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/plugin_api.dart';

import 'package:http/http.dart' as http;

import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  final PopupController _popupController = PopupController();
  double currentZoom = 6.5;
  MapController mapController = MapController();
  LatLng currentCenter = LatLng(35.63850316645632, 10.092159470694954);

  void _zoom() {
    currentZoom = currentZoom + 1;
    mapController.move(
      currentCenter,
      currentZoom,
    );
  }

  void _zoom1() {
    currentZoom = currentZoom - 1;
    mapController.move(
      currentCenter,
      currentZoom,
    );
  }

  List markers1;
  List<Marker> markers;
  int pointIndex;
  List points = [
    //LatLng(35.825985195648805, 10.25383083191429),
    LatLng(35.63850316645632, 10.092159470694954),
  ];

  List all = List();
  List all1 = List();
  Future get() async {
    try {
      markers = [];
      var url = "http://192.168.43.32/app/getmarker.php";
      var response = await http.get(
        url,
        headers: {"Accept": "application/json"},
      );

      if (response.statusCode == 200) {
        setState(() {
          all = jsonDecode(response.body);
        });
      }
      //print(all[0]['meta_value']);

      for (var i = 0; i < all.length; i++) {
        String a = all[i]['meta_value'];

        var c = a.split(',');
        if (c != null) {
          double b = double.parse(c[0]);
          double d = double.parse(c[1]);
          markers.add(
            Marker(
              anchorPos: AnchorPos.align(AnchorAlign.center),
              height: 200,
              width: 100,
              point: LatLng(b, d),
              builder: (ctx) => Icon(
                Icons.location_on,
                size: 35,
              ),
            ),
          );
          print(markers.length);
          print(all[0]['post_id']);
        }

        //  print(c[0]);
        // print(c[1]);

        //print(markers.length);
      }
      print(markers.length);

      //print(markers);
      //return all[0]['post_id'];
    } catch (e) {
      print(e);
    }
    //return markers;
  }

  var b = "";
  var name = "";
  var titre = "";

  Future<String> res(point, p) async {
    try {
      String a = point.toString();
      String x = p.toString();
      // print(x);

      //print(x.replaceAll(' ', ''));

      //print(a);
      //print(p);

      // print(a);
      //
      var url = "http://192.168.43.32/app/getmarkinfo.php";
      var response = await http.post(url, headers: {
        "Accept": "application/json"
      }, body: {
        "point": a.toString() + ", " + x,
      });
      if (response.statusCode == 200) {
        setState(() {
          all1 = jsonDecode(response.body);
        });

        //print(all1[0]['post_title']);
        name = all1[0]['ID'];
        // print(all1);
        var titre = all1[0]['post_title'];
        return name + "\n" + titre;
      } else {
        print("hh");
      }
    } catch (e) {
      //print(b);
      print("ss");
    }
  }

  @override
  void initState() {
    pointIndex = 0;
    markers = [];

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      get();
    });
    // get();
  }

  @override
  void dispose() {
    super.dispose();
    // get();
  }

  @override
  Widget build(BuildContext context) {
    // get();
    //var a = get();
    // print("1");
    // print(markers);
    //
    //res(36.074918287861216, 10.438015685015724).then((value) => print(value));
    //
    //print(x);

    return Scaffold(
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
            center: points[0],
            onLongPress: (latLng) =>
                debugPrint("'${latLng.latitude}, ${latLng.longitude}'"),
            zoom: currentZoom,
            maxZoom: 500,
            plugins: [
              MarkerClusterPlugin(),
            ],
            onTap: (_) {
              _popupController.hidePopup();
            }

            // Hide popup when the map is tapped.
            ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerClusterLayerOptions(
            maxClusterRadius: 100,
            disableClusteringAtZoom: 200,
            size: Size(40, 40),
            anchor: AnchorPos.align(AnchorAlign.center),
            fitBoundsOptions: FitBoundsOptions(
              padding: EdgeInsets.all(10),
            ),
            markers: markers,
            polygonOptions: PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 5),
            popupOptions: PopupOptions(
              popupSnap: PopupSnap.markerBottom,
              popupController: _popupController,
              popupBuilder: (_, marker) => Container(
                width: 200,
                height: 100,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: FutureBuilder(
                        future:
                            res(marker.point.latitude, marker.point.longitude),
                        builder: (context, snapshot) {
                          return Text(
                            "" + "${snapshot.data.toString()}",
                            style: TextStyle(fontSize: 20),
                          );
                        },
                      ),
                      onTap: () {
                        // res(marker.point.latitude, marker.point.longitude);
                      },
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/cards/photo.jpeg"),
                      radius: 40,
                    ),
                  ],
                ),
              ),
            ),
            builder: (context, markers) {
              return FloatingActionButton(
                child: Text(markers.length.toString()),
                onPressed: null,
              );
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _zoom,
            tooltip: 'Zoom',
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: _zoom1,
            tooltip: 'Zoom',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

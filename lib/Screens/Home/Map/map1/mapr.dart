import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

import 'package:http/http.dart' as http;

class Mapr extends StatefulWidget {
  final double k;
  final double k1;
  final String id;

  const Mapr({Key key, this.k, this.k1, this.id}) : super(key: key);
  @override
  _MaprState createState() => _MaprState();
}

class _MaprState extends State<Mapr> {
  final PopupController _popupController = PopupController();
  MapController co = new MapController();

  List<Marker> markers;
  int pointIndex;
  List points = [
    //LatLng(35.825985195648805, 10.25383083191429),
    LatLng(35.63850316645632, 10.092159470694954),
  ];

  List all = List();
  List all1 = List();

  Future get1() async {
    try {
      markers = [];
      var url = "http://192.168.43.32/app/getmarker.php";
      var response =
          await http.get(url, headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        setState(() {
          all = jsonDecode(response.body);
        });
      }
      //print(all[0]['meta_value']);

      for (var i = 0; i < all.length; i++) {
        String a = all[i]['meta_value'];
        var c = a.split(',');
        double b = double.parse(c[0]);
        double d = double.parse(c[1]);
        //  print(c[0]);
        // print(c[1]);

        markers.add(
          Marker(
            anchorPos: AnchorPos.align(AnchorAlign.center),
            height: 30,
            width: 30,
            point: LatLng(b, d),
            builder: (ctx) => Icon(
              Icons.location_on,
              size: 50,
            ),
          ),
        );

        //print(markers.length);
      }
      print(markers.length);
      print(all[0]['post_id']);
      //print(markers);
      //return all[0]['post_id'];
    } catch (e) {
      print("ff");
    }
    //return markers;
  }

  Future get(v2) async {
    try {
      if (v2 == null) {
        print(v2);
      } else {
        markers = [];
        var url = "http://192.168.43.32/app/get_cat.php";
        var response = await http.post(url, headers: {
          "Accept": "application/json"
        }, body: {
          "id": v2.toString(),
        });

        if (response.statusCode == 200) {
          setState(() {
            all = jsonDecode(response.body);
          });
        }
        //print(all[0]['meta_value']);

        for (var i = 0; i < all.length; i++) {
          String a = all[i]['meta_value'];
          var c = a.split(',');
          double b = double.parse(c[0]);
          double d = double.parse(c[1]);
          //  print(c[0]);
          // print(c[1]);
          //

          markers.add(
            Marker(
              anchorPos: AnchorPos.align(AnchorAlign.center),
              height: 100,
              width: 100,
              point: LatLng(b, d),
              builder: (ctx) => Icon(
                Icons.location_on,
                size: 35,
              ),
            ),
          );

          //print(markers.length);
        }
        print(markers.length);
        print(all[0]);
        //print(markers);
        //return all[0]['post_id'];
      }
    } catch (e) {
      get1();
    }
    //return markers;
  }

  var b = "";
  var name = "";
  var titre = "";

  Future<String> res(point, p) async {
    try {
      String a = point.toString();

      //print(a);
      //
      //print(p);

      // print(a);
      var url = "http://192.168.43.32/app/getmarkinfo.php";
      var response = await http.post(url, headers: {
        "Accept": "application/json"
      }, body: {
        "point": a.toString() + ", " + p.toString(),
      });
      if (response.statusCode == 200) {
        setState(() {
          all1 = jsonDecode(response.body);
        });

        //print(all1[0]['post_title']);
        name = all1[0]['post_title'];
        var titre = all1[0]['post_title'];
        return name + "\n" + titre;
      } else {
        print("hh");
      }
    } catch (e) {
      //print(b);
      print(e);
    }
  }

  @override
  void initState() {
    pointIndex = 0;
    markers = [];

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      get(widget.id);

      //get1();
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
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(widget.k, widget.k1), zoom: 11.5,

          plugins: [
            MarkerClusterPlugin(),
          ],
          onTap: (_) => _popupController
              .hidePopup(), // Hide popup when the map is tapped.
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
                popupSnap: PopupSnap.markerTop,
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
                              future: res(marker.point.latitude,
                                  marker.point.longitude),
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
                            backgroundImage:
                                AssetImage("assets/cards/photo.jpeg"),
                            radius: 40,
                          ),
                        ],
                      ),
                    )),
            builder: (context, markers) {
              return FloatingActionButton(
                child: Text(markers.length.toString()),
                onPressed: null,
              );
            },
          ),
        ],
      ),
    );
  }
}

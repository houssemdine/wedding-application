import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/plugin_api.dart';

import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong/latlong.dart';
import 'package:mari/Screens/AdminIN/Ajoutad.dart';
import 'package:mari/Screens/AdminIN/mod.dart';
import 'package:mari/components/roundbat.dart';
import 'package:mari/constant.dart';

class Pos extends StatefulWidget {
  final double la;
  final double lg;
  final double id;
  final String no;
  final String tio;
  final String co;
  final String tel;
  final String se;
  final iid;

  const Pos(
      {Key key,
      this.la,
      this.lg,
      this.id,
      this.no,
      this.tio,
      this.co,
      this.tel,
      this.se,
      this.iid})
      : super(key: key);
  @override
  _PosState createState() => _PosState();
}

class _PosState extends State<Pos> {
  final PopupController _popupController = PopupController();

  var a = 35.63850316645632;
  var b = 10.092159470694954;
  List<Marker> markers;
  int pointIndex;
  List points = [
    //LatLng(35.825985195648805, 10.25383083191429),
    LatLng(35.63850316645632, 10.092159470694954),
  ];
  List<Marker> mark = [];
  get(a, b) {
    setState(() {
      mark.add(
        Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(a, b),
          builder: (ctx) => Icon(Icons.pin_drop),
        ),
      );
    });
  }

  @override
  void initState() {
    pointIndex = 0;
    markers = [
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: points[pointIndex],
        builder: (ctx) => Icon(Icons.pin_drop),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(35.708091575816525, 10.656006787640816),
        builder: (ctx) => Icon(Icons.pin_drop_rounded),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(35.72764449142327, 10.745753524797115),
        builder: (ctx) => Icon(Icons.pin_drop_rounded),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(35.775206636050775, 10.826300506547463),
        builder: (ctx) => Icon(Icons.pin_drop_rounded),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(36.83442691944919, 10.073682715830477),
        builder: (ctx) => Icon(Icons.pin_drop_rounded),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(32.940811957833674, 9.20527650464465),
        builder: (ctx) => Icon(Icons.pin_drop_rounded),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(32.940811957833674, 9.20527650464465),
        builder: (ctx) => Icon(Icons.pin_drop_rounded),
      ),
    ];

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FlutterMap(
          options: MapOptions(
            center: LatLng(widget.la, widget.lg), zoom: 11.5,
            onLongPress: (latLng) {
              debugPrint("'${latLng.latitude}, ${latLng.longitude}'");
              a = latLng.latitude;
              b = latLng.longitude;

              print(mark.length);
              Fluttertoast.showToast(
                  msg: "la Position est " + a.toString() + b.toString(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              setState(() {
                mark.add(
                  Marker(
                    width: 150.0,
                    height: 150.0,
                    point: latLng,
                    builder: (ctx) => const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 35.0,
                    ),
                  ),
                );
              });
            },

            plugins: [
              MarkerClusterPlugin(),
            ],
            onTap: (_) => _popupController.hidePopup(),

            // Hide popup when the map is tapped.
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerClusterLayerOptions(
              maxClusterRadius: 100,
              disableClusteringAtZoom: 20,
              size: Size(40, 40),
              anchor: AnchorPos.align(AnchorAlign.center),
              fitBoundsOptions: FitBoundsOptions(
                padding: EdgeInsets.all(10),
              ),
              markers: [for (int i = 0; i < mark.length; i++) mark[i]],
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
                        child: GestureDetector(
                          onTap: () => debugPrint("Popup tap!"),
                          child: Text(
                            "Container popup for marker at ${marker.point}",
                          ),
                        ),
                      )),
              builder: (context, markers) {
                return FloatingActionButton(
                  child: Text(markers.length.toString()),
                  onPressed: () {},
                );
              },
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: "retour",
                  backgroundColor: Colors.red,
                  child: Icon(Icons.arrow_back_outlined),
                  onPressed: () {
                    if (widget.id == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AjoutP(
                            a: a,
                            b: b,
                            c1: widget.no,
                            c2: widget.tio,
                            c3: widget.co,
                          ),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => mod(
                            tel: widget.tel,
                            s: widget.se,
                            a: a,
                            b: b,
                            t1: widget.no,
                            t2: widget.tio,
                            t3: widget.co,
                          ),
                        ),
                      );
                    }
                  },
                ),
                FloatingActionButton(
                  heroTag: "b1",
                  backgroundColor: Colors.green,
                  child: Icon(Icons.add),
                  onPressed: () {
                    print(a.toString() + "," + b.toString());
                    if (a == null) {
                      Fluttertoast.showToast(
                          msg: "Choisir une position",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      if (widget.id == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AjoutP(
                              a: a,
                              b: b,
                              c1: widget.no,
                              c2: widget.tio,
                              c3: widget.co,
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => mod(
                              a: a,
                              b: b,
                              t1: widget.no,
                              t2: widget.tio,
                              t3: widget.co,
                              tel: widget.tel,
                              s: widget.se,
                              id2: widget.iid,
                            ),
                          ),
                        );
                      }
                    }
                  },
                )
              ],
            ),
          ],
        ));
  }
}

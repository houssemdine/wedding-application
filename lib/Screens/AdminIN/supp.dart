import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mari/Screens/AdminIN/mod.dart';
import 'package:mari/components/roundbat.dart';

class supp extends StatefulWidget {
  final String id;

  const supp({Key key, this.id}) : super(key: key);
  @override
  _suppState createState() => _suppState();
}

class _suppState extends State<supp> {
  List all = List();

  Future getall() async {
    var response = await http.get("http://192.168.43.32/app/getall.php");
    if (response.statusCode == 200) {
      if (this.mounted) {
        // check whether the state object is in tree
        setState(() {
          all = jsonDecode(response.body);
        });
      }
      //print(all);
      return all;
    }
  }

  Future suppr(String a) async {
    try {
      var response =
          await http.post("http://192.168.43.32/app/sup.php", headers: {
        "Accept": "application/json"
      }, body: {
        "ID": a,
      });
      var data = json.decode(response.body);
      //print(data);
      if (data == "Success") {
        Fluttertoast.showToast(
            msg: "Trés bien",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Trés bien",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    getall();
  }

  @override
  void dispose() {
    getall();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getall();
    return Scaffold(
      appBar: AppBar(
        title: Text('    Supprimer un Partenaire'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
          itemCount: all.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(all[index]['ID']),
              trailing: Text(all[index]['post_title']),
              onTap: () {
                print(all[index]['ID']);

                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title:
                              Text("vous etes sure de supprimer ce partenaire"),
                          actions: [
                            Row(
                              children: [
                                butt(
                                  col: Colors.green,
                                  text: "oui",
                                  press: () {
                                    //print(all[index]['ID']);
                                    suppr(all[index]['ID']);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                Padding(padding: EdgeInsets.all(15)),
                                butt(
                                  col: Colors.red,
                                  text: "non",
                                  press: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            )
                          ],
                        ));
              },
            );
          }),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mari/Screens/Login/components/Text.dart';
import 'package:mari/components/roundbat.dart';
import 'package:http/http.dart' as http;

class Invi extends StatefulWidget {
  @override
  _InviState createState() => _InviState();
}

class _InviState extends State<Invi> {
  TextEditingController type = new TextEditingController();
  TextEditingController nb = new TextEditingController();
  String inp = "";
  List todos = List();
  List todos1 = List();
  List todos2 = List();

  Future get() async {
    try {
      var url = "http://192.168.43.32/app/invi.php";
      var response =
          await http.get(url, headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        if (this.mounted) {
          // check whether the state object is in tree
          setState(() {
            todos1 = jsonDecode(response.body);
          });
        }
        //print(todos1);
        return todos1;
      }
    } catch (e) {
      print(e);
    }
  }

  var a;
  Future getall() async {
    try {
      var url = "http://192.168.43.32/app/getallin.php";
      var response =
          await http.get(url, headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        if (this.mounted) {
          // check whether the state object is in tree
          setState(() {
            todos2 = jsonDecode(response.body);
          });
        }
        //print(todos2[0]['v']);
        a = todos2[0]['v'];
        return a;
      }
    } catch (e) {
      print(e);
    }
  }

  Future ajou() async {
    try {
      var url = "http://192.168.43.32/app/ajouin.php";
      var response = await http.post(url, headers: {
        "Accept": "application/json"
      }, body: {
        "type": type.text,
        "nb": nb.text,
      });
      var data = json.decode(response.body);
      print(data);
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
    } catch (e) {
      print(e);
    }
  }

  Future supp(a) async {
    try {
      var url = "http://192.168.43.32/app/suppinvi.php";
      var response = await http.post(url, headers: {
        "Accept": "application/json"
      }, body: {
        "id": a,
      });
      var data = json.decode(response.body);

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
    } catch (e) {
      print(e);
    }
  }

  var _isVisible;
  ScrollController _hideButtonController;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      get();
      getall();
    });
    a = "";
    get();
    getall();
    _isVisible = true;
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible == true) {
          /* only set when the previous state is false
             * Less widget rebuilds 
             */
          print("**** ${_isVisible} up"); //Move IO away from setState
          setState(() {
            _isVisible = false;
          });
        }
      } else {
        if (_hideButtonController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (_isVisible == false) {
            /* only set when the previous state is false
               * Less widget rebuilds 
               */
            //print("**** ${_isVisible} down"); //Move IO away from setState
            setState(() {
              _isVisible = true;
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getall();
    get();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: new Visibility(
          visible: _isVisible,
          child: FloatingActionButton(
            heroTag: null,
            backgroundColor: Colors.teal,
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                        child: AlertDialog(
                      title: Text(
                        "Ajouter des invités",
                        style: TextStyle(fontSize: 25, color: Colors.blue),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Roundt(
                            con: type,
                            icon: Icons.merge_type_sharp,
                            hintText: "Type ",
                          ),
                          Roundt(
                            con: nb,
                            hintText: "Nombre ",
                            a: TextInputType.number,
                            icon: Icons.family_restroom_sharp,
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            butt(
                              col: Colors.teal,
                              text: "Ajouter",
                              press: () {
                                if (type.text == "") {
                                  //get();
                                  Fluttertoast.showToast(
                                      msg: "Champ Vide",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  ajou();
                                  type.text = "";
                                  nb.text = "";

                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            butt(
                              text: "Retour",
                              col: Colors.red,
                              press: () {
                                //print(todos1[0]['v']);
                                //get();
                                //getall();
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        )
                      ],
                    ));
                  });
            },
          )),
      body: Column(
        children: [
          Container(
              //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              padding: EdgeInsets.all(30.30),
              width: 500,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(0),
              ),
              child: Column(
                children: [
                  Text(
                    "Total " + a.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  )
                ],
              )),

          //Text(todos1[0]['v']),
          Flexible(
            child: ListView.builder(
                controller: _hideButtonController,
                padding: const EdgeInsets.all(8),
                itemCount: todos1.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                      key: Key(todos1[index]['id']),
                      child: Card(
                        shadowColor: Colors.teal,
                        elevation: 14,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: ListTile(
                          title: Text(todos1[index]['nb'] +
                              "  " +
                              todos1[index]['type']),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () {
                              supp(todos1[index]['id'].toString());
                            },
                          ),
                        ),
                      ));
                }),
          ),
        ],
      ),
    );
  }
}

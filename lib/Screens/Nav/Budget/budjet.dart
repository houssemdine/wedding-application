import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mari/Screens/Login/components/Text.dart';
import 'package:mari/components/roundbat.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mari/constant.dart';

class Budjet extends StatefulWidget {
  @override
  _BudjetState createState() => _BudjetState();
}

class Item1 {
  const Item1(this.name, this.id);
  final String name;
  final int id;
}

Item1 selectedjob;

class _BudjetState extends State<Budjet> {
  TextEditingController type = new TextEditingController();
  TextEditingController nb = new TextEditingController();
  List<Item1> job = <Item1>[
    const Item1('Hotel', 67),
    const Item1('Salle de fete', 80),
    const Item1('Resto', 83),
    const Item1('agence immobilière', 86),
    const Item1('Photographe', 79),
    const Item1('Soin', 74),
    const Item1('Coiffures', 72),
    const Item1('Traiteur et pâtisserie', 81),
    const Item1('Agences de voyages', 65),
    const Item1('Bijoux', 75),
  ];
  String inp = "";
  List todos = List();
  List todos1 = List();
  List todos2 = List();
  Item1 selectedjob;
  var v2;
  var v3;
  Future ajou(v2, v3) async {
    try {
      var url = "http://192.168.43.32/app/ajouter_un_depense.php";
      var response = await http.post(url, headers: {
        "Accept": "application/json"
      }, body: {
        "monatnt": nb.text,
        "nb": v2.toString(),
        "des": v3,
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

  Future supp(a1) async {
    try {
      var url = "http://192.168.43.32/app/supbudjet.php";
      var response = await http.post(url, headers: {
        "Accept": "application/json"
      }, body: {
        "id": a1,
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

  Future get() async {
    try {
      var url = "http://192.168.43.32/app/getbudget.php";
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

  getall() async {
    try {
      var url = "http://192.168.43.32/app/getallbudget.php";
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
        a = todos2[0]['v'].toString();
        return a;
      }
    } catch (e) {
      print(e);
    }
  }

  var _isVisible;
  ScrollController _hideButtonController;
  @override
  void initState() {
    super.initState();
    //todos.add('1  DT');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      a = "";
      get();
      getall();
    });
    _isVisible = true;
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible == true) {
          /* only set when the previous state is false
             * Less widget rebuilds 
             */
          //print("**** ${_isVisible} up"); //Move IO away from setState
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
            print("**** ${_isVisible} down"); //Move IO away from setState
            setState(() {
              _isVisible = true;
            });
          }
        }
      }
    });

    get();
    getall();
  }

  @override
  Widget build(BuildContext context) {
    get();
    getall();
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
                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return SingleChildScrollView(
                        child: AlertDialog(
                      title: Text(
                        "Ajouter une dépense",
                        style: TextStyle(fontSize: 25, color: Colors.blue),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Roundt(
                            con: nb,
                            hintText: "Prix",
                            a: TextInputType.number,
                            icon: Icons.money,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            padding: EdgeInsets.all(9),
                            // width: ,
                            decoration: BoxDecoration(
                              color: kPrimaryLigthColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: DropdownButton<Item1>(
                              hint: Text("Choisiez Une Catégorie"),
                              value: selectedjob,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              style: TextStyle(color: Colors.deepPurple),
                              onChanged: (Item1 Value1) {
                                setState(() {
                                  selectedjob = Value1;
                                  v2 = Value1.id;
                                  v3 = Value1.name;
                                });
                              },
                              items: job.map((Item1 jo) {
                                return DropdownMenuItem<Item1>(
                                  value: jo,
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        jo.name,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          )
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
                                if (nb.text == "") {
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
                                  ajou(v2, v3);
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
                });
          },
        ),
      ),
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
                  "Total  " + a.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                )
              ],
            ),
          ),
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
                      margin: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: ListTile(
                        title: Text(todos1[index]['depense'] +
                            "   DT \n" +
                            todos1[index]['nom']),
                        trailing: IconButton(
                          icon: Icon(Icons.delete_sharp),
                          color: Colors.red,
                          onPressed: () {
                            setState(() {
                              supp(todos1[index]['id']);
                            });
                          },
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

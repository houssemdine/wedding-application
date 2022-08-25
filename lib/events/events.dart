import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mari/events/res.dart';
import 'dart:convert';

class event extends StatefulWidget {
  @override
  _eventState createState() => _eventState();
}

class _eventState extends State<event> {
  List todos1 = List();
  List todos2 = List();
  List all = List();
  TextEditingController type = new TextEditingController();
  TextEditingController nb = new TextEditingController();

  Color _colorContainer = Colors.white;
  Color _colorContainer1 = Colors.white;
  Color _colorContainer2 = Colors.white;
  Color _colorContainer3 = Colors.white;
  Color _colorContainer4 = Colors.white;
  Color _colorContainer5 = Colors.white;
  Color _colorContainer6 = Colors.white;
  Color _colorContainer7 = Colors.white;
  Color _colorContainer8 = Colors.white;

  var a = "0";

  getall(a) async {
    try {
      var url = "http://192.168.43.32/app/get_total.php";
      var response = await http.post(url,
          headers: {"Accept": "application/json"}, body: {"id": a.toString()});
      if (response.statusCode == 200) {
        if (this.mounted) {
          // check whether the state object is in tree
          setState(() {
            todos2 = jsonDecode(response.body);
          });
        }
        //print(todos2[0]['v']);
        todos2[0]['v'].toString();
        if (todos2[0]['v'] == null) {
          return "0";
        } else {
          return todos2[0]['v'].toString();
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future get() async {
    try {
      var url = "http://192.168.43.32/app/tik.php";
      var response = await http.get(
        url,
        headers: {"Accept": "application/json"},
      );
      if (response.statusCode == 200) {
        setState(() {
          all = jsonDecode(response.body);
        });

        for (var i = 0; i < all.length; i++) {
          var c = all[i]['col'];

          if (c == "0") {
          } else {}
        }

        var a = all[0]['col'];
        if (a == "0") {
          print(all[0]['col']);
        } else {
          print("dd");
        }

        //print(all[0]['col']);
      }
    } catch (e) {
      print("jja");
    }
  }

  @override
  void initState() {
    super.initState();
    todos1.add("Salle de fete");
    a = "0";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Flexible(
          child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(2),
              itemCount: todos1.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(todos1[index]),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        //clipBehavior: Clip.antiAlias,

                        shadowColor: Colors.teal,

                        elevation: 14,
                        margin: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(children: [
                          /* FutureBuilder(
                      
                        builder: (context, snapshot) {
                          return Text(
                            "" + "${snapshot.data.toString()}",
                            style: TextStyle(fontSize: 20),
                          );
                        },
                      ),*/
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/cards/sal.jpeg"),
                            radius: 50,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Column(
                            children: [
                              Text(
                                "J-12 MOIS",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink[600]),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "    Trouver la salle de fete\nsouhaitée",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.7)),
                                textAlign: TextAlign.center,
                              ),
                              FutureBuilder(
                                future: getall(80),
                                builder: (context, snapshot) {
                                  return Text(
                                    "" + "${snapshot.data.toString()}" + " DT",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black.withOpacity(0.7)),
                                  );
                                },
                              )
                            ],
                          ),

                          Row(
                            children: [
                              ClipOval(
                                child: Material(
                                  color: _colorContainer, // button color
                                  child: InkWell(
                                    // inkwell color
                                    child: SizedBox(
                                        width: 56,
                                        height: 56,
                                        child: Icon(Icons.check)),
                                    onTap: () {
                                      setState(() {
                                        _colorContainer =
                                            _colorContainer == Colors.green[200]
                                                ? Colors.white
                                                : Colors.green[200];

                                        if (_colorContainer ==
                                            Colors.green[200]) {
                                          print("vert");
                                        } else {
                                          print("***");
                                        }
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          )

                          //Image.asset('assets/card-sample-image-2.jpg'),
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        //clipBehavior: Clip.antiAlias,
                        //
                        shadowColor: Colors.teal,

                        elevation: 14,
                        margin: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/cards/photo.jpeg"),
                            radius: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                "J-10 MOIS",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink[600]),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Chercher un photographe",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                              FutureBuilder(
                                future: getall(79),
                                builder: (context, snapshot) {
                                  return Text(
                                    "" + "${snapshot.data.toString()}" + " DT",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black.withOpacity(0.7)),
                                  );
                                },
                              )
                            ],
                          ),
                          Row(
                            children: [
                              ClipOval(
                                child: Material(
                                  color: _colorContainer1, // button color
                                  child: InkWell(
                                    // inkwell color
                                    child: SizedBox(
                                        width: 56,
                                        height: 56,
                                        child: Icon(Icons.check)),
                                    onTap: () {
                                      setState(() {
                                        _colorContainer1 = _colorContainer1 ==
                                                Colors.green[200]
                                            ? Colors.white
                                            : Colors.green[200];
                                      });
                                      print(_colorContainer1.value);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )

                          //Image.asset('assets/card-sample-image-2.jpg'),
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        //clipBehavior: Clip.antiAlias,
                        //
                        shadowColor: Colors.teal,

                        elevation: 14,
                        margin: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/cards/agnce.jpg"),
                            radius: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                "J-08 MOIS",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink[600]),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Contacter des agence\n                immobilière       ",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                              FutureBuilder(
                                future: getall(86),
                                builder: (context, snapshot) {
                                  return Text(
                                    "" + "${snapshot.data.toString()}" + " DT",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black.withOpacity(0.7)),
                                  );
                                },
                              )
                            ],
                          ),

                          //Image.asset('assets/card-sample-image-2.jpg'),
                          Row(
                            children: [
                              ClipOval(
                                child: Material(
                                  color: _colorContainer2, // button color
                                  child: InkWell(
                                    // inkwell color
                                    child: SizedBox(
                                        width: 56,
                                        height: 56,
                                        child: Icon(Icons.check)),
                                    onTap: () {
                                      setState(() {
                                        _colorContainer2 = _colorContainer2 ==
                                                Colors.green[200]
                                            ? Colors.white
                                            : Colors.green[200];
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          )
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        //clipBehavior: Clip.antiAlias,
                        //
                        shadowColor: Colors.teal,

                        elevation: 14,
                        margin: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/cards/rob.jpeg"),
                            radius: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                "   J-04 MOIS",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink[600]),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "           Choisir une robe",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                              FutureBuilder(
                                future: getall(77),
                                builder: (context, snapshot) {
                                  return Text(
                                    "" + "${snapshot.data.toString()}" + " DT",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black.withOpacity(0.7)),
                                  );
                                },
                              )
                            ],
                          ),

                          //Image.asset('assets/card-sample-image-2.jpg'),
                          Row(
                            children: [
                              ClipOval(
                                child: Material(
                                  color: _colorContainer3, // button color
                                  child: InkWell(
                                    // inkwell color
                                    child: SizedBox(
                                        width: 56,
                                        height: 56,
                                        child: Icon(Icons.check)),
                                    onTap: () {
                                      setState(() {
                                        _colorContainer3 = _colorContainer3 ==
                                                Colors.green[200]
                                            ? Colors.white
                                            : Colors.green[200];
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          )
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        //clipBehavior: Clip.antiAlias,
                        //
                        shadowColor: Colors.teal,

                        elevation: 14,
                        margin: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/cards/all.jpg"),
                            radius: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                "J-03 MOIS",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink[600]),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "      choisir des alliance",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                              FutureBuilder(
                                future: getall(81),
                                builder: (context, snapshot) {
                                  return Text(
                                    "" + "${snapshot.data.toString()}" + " DT",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black.withOpacity(0.7)),
                                  );
                                },
                              )
                            ],
                          ),
                          Row(
                            children: [
                              ClipOval(
                                child: Material(
                                  color: _colorContainer4,
                                  // button color
                                  child: InkWell(
                                    // inkwell color
                                    child: SizedBox(
                                        width: 56,
                                        height: 56,
                                        child: Icon(Icons.check)),
                                    onTap: () {
                                      setState(() {
                                        _colorContainer4 = _colorContainer4 ==
                                                Colors.green[200]
                                            ? Colors.white
                                            : Colors.green[200];
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          )

                          //Image.asset('assets/card-sample-image-2.jpg'),
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        //clipBehavior: Clip.antiAlias,
                        //
                        shadowColor: Colors.teal,

                        elevation: 14,
                        margin: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/cards/pat.jpeg"),
                            radius: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                "J-02 MOIS",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink[600]),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                " Contacter les patisseries",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                              FutureBuilder(
                                future: getall(65),
                                builder: (context, snapshot) {
                                  return Text(
                                    "" + "${snapshot.data.toString()}" + " DT",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black.withOpacity(0.7)),
                                  );
                                },
                              )
                            ],
                          ),
                          Row(
                            children: [
                              ClipOval(
                                child: Material(
                                  color: _colorContainer5, // button color
                                  child: InkWell(
                                    // inkwell color
                                    child: SizedBox(
                                        width: 56,
                                        height: 56,
                                        child: Icon(Icons.check)),
                                    onTap: () {
                                      setState(() {
                                        _colorContainer5 = _colorContainer5 ==
                                                Colors.green[200]
                                            ? Colors.white
                                            : Colors.green[200];
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          )

                          //Image.asset('assets/card-sample-image-2.jpg'),
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        //clipBehavior: Clip.antiAlias,
                        //
                        shadowColor: Colors.teal,

                        elevation: 14,
                        margin: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/cards/vo.jpg"),
                            radius: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                "J-01 MOIS",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink[600]),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "   Réserver le voyage \n            de noces",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                              FutureBuilder(
                                future: getall(56),
                                builder: (context, snapshot) {
                                  return Text(
                                    "" + "${snapshot.data.toString()}" + " DT",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black.withOpacity(0.7)),
                                  );
                                },
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipOval(
                                child: Material(
                                  color: _colorContainer6, // button color
                                  child: InkWell(
                                    // inkwell color
                                    child: SizedBox(
                                        width: 56,
                                        height: 56,
                                        child: Icon(Icons.check)),
                                    onTap: () {
                                      setState(() {
                                        _colorContainer6 = _colorContainer6 ==
                                                Colors.green[200]
                                            ? Colors.white
                                            : Colors.green[200];
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          )
                          //Image.asset('assets/card-sample-image-2.jpg'),
                        ]),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Card(
                          //clipBehavior: Clip.antiAlias,
                          //
                          shadowColor: Colors.teal,

                          elevation: 14,
                          margin: EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(children: [
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/cards/1.jpg"),
                              radius: 50,
                            ),
                            Column(
                              children: [
                                Text(
                                  "    J-4 JOUR            ",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink[600]),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "  Les Soin \n           ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black.withOpacity(0.7)),
                                ),
                                FutureBuilder(
                                  future: getall(74),
                                  builder: (context, snapshot) {
                                    return Text(
                                      "" +
                                          "${snapshot.data.toString()}" +
                                          " DT",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black.withOpacity(0.7)),
                                    );
                                  },
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipOval(
                                  child: Material(
                                    color: _colorContainer7, // button color
                                    child: InkWell(
                                      // inkwell color
                                      child: SizedBox(
                                          width: 56,
                                          height: 56,
                                          child: Icon(Icons.check)),
                                      onTap: () {
                                        setState(() {
                                          _colorContainer7 = _colorContainer7 ==
                                                  Colors.green[200]
                                              ? Colors.white
                                              : Colors.green[200];
                                        });
                                      },
                                    ),
                                  ),
                                )
                              ],
                            )
                            //Image.asset('assets/card-sample-image-2.jpg'),
                          ]),
                        )),
                    GestureDetector(
                        onTap: () {},
                        child: Card(
                          //clipBehavior: Clip.antiAlias,
                          //
                          shadowColor: Colors.teal,

                          elevation: 14,
                          margin: EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(children: [
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/cards/2.jpg"),
                              radius: 50,
                            ),
                            Column(
                              children: [
                                Text(
                                  "   LE JOUR J           ",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink[600]),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "  Coiffer et maquille \n           ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black.withOpacity(0.7)),
                                ),
                                FutureBuilder(
                                  future: getall(72),
                                  builder: (context, snapshot) {
                                    return Text(
                                      "" +
                                          "${snapshot.data.toString()}" +
                                          " DT",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black.withOpacity(0.7)),
                                    );
                                  },
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipOval(
                                  child: Material(
                                    color: _colorContainer8, // button color
                                    child: InkWell(
                                      // inkwell color
                                      child: SizedBox(
                                          width: 56,
                                          height: 56,
                                          child: Icon(Icons.check)),
                                      onTap: () {
                                        setState(() {
                                          _colorContainer8 = _colorContainer8 ==
                                                  Colors.green[200]
                                              ? Colors.white
                                              : Colors.green[200];
                                        });
                                      },
                                    ),
                                  ),
                                )
                              ],
                            )
                            //Image.asset('assets/card-sample-image-2.jpg'),
                          ]),
                        )),
                  ]),
                );
              }),
        ),
      ]),
    );
  }
}

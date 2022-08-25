import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:mari/Screens/Home/Map/map1/mapr.dart';

import 'package:mari/components/roundbat.dart';
import 'package:mari/constant.dart';

class Rech extends StatefulWidget {
  @override
  _RechState createState() => _RechState();
}

double ka;
double ki;

class Item {
  const Item(this.name);
  final String name;
}

class Item1 {
  const Item1(this.name, this.id);
  final String name;
  final int id;
}

String v1;

Item selectedUser;
Item1 selectedjob;

class _RechState extends State<Rech> {
  Item holder;
  List<Item> users = <Item>[
    const Item(
      'Sousse',
    ),
    const Item(
      'Tunis',
    ),
    const Item(
      'Djerba',
    ),
    const Item(
      'Sfax',
    ),
    const Item(
      'Monastir',
    ),
    const Item(
      'Nabel',
    ),
    const Item(
      'Mahdia',
    ),
    const Item(
      'Gabes',
    ),
    const Item(
      'Médenine',
    ),
    const Item(
      'Tatouine',
    ),
    const Item(
      'kebili',
    ),
    const Item(
      'Gafsa',
    ),
    const Item(
      'Sidi Bouzid',
    ),
    const Item(
      'Kasserine',
    ),
    const Item(
      'Kairouan',
    ),
    const Item(
      'Le Kef',
    ),
    const Item(
      'Béja',
    ),
    const Item(
      'Jendouba',
    ),
    const Item(
      'Bizert',
    ),
    const Item(
      'Siliana',
    ),
    const Item(
      'Zaghouan',
    ),
    const Item(
      'Tozeur',
    ),
  ];
  List<Item1> job = <Item1>[
    const Item1('Hotel', 67),
    const Item1('Salle de fete', 80),
    const Item1('Resto', 83),
    const Item1('Maison', 86),
    const Item1('Photographe', 79),
    const Item1('Soin', 74),
    const Item1('Coiffures', 72),
    const Item1('Traiteur et pâtisserie', 81),
    const Item1('Agences de voyages', 65),
    const Item1('Bijoux', 75),
  ];
  var v2;

  res(String v1) {
    if (v1 == "Djerba") {
      ka = 33.81848116787286;
      ki = 10.87989277181634;
    }
    if (v1 == "Sousse") {
      ka = 35.82436997306491;
      ki = 10.62357056212221;
    }
    if (v1 == "Tunis") {
      ka = 36.80615037014172;
      ki = 10.162979790372503;
    }
    if (v1 == "Sfax") {
      ka = 34.73817747524188;
      ki = 10.759643089186364;
    }
    if (v1 == "Monastir") {
      ka = 35.773073350670835;
      ki = 10.82455372771048;
    }
    if (v1 == "Nabel") {
      ka = 36.452459124480676;
      ki = 10.736798776188298;
    }
    if (v1 == "Mahdia") {
      ka = 35.50367054891884;
      ki = 11.062783736767278;
    }
    if (v1 == "Gabes") {
      ka = 33.887980409548376;
      ki = 10.098733454042899;
    }
    if (v1 == "Médenine") {
      ka = 33.34497266641852;
      ki = 10.491084934537271;
    }
    if (v1 == "Tatouine") {
      ka = 32.931494232110204;
      ki = 10.450272010440107;
    }
    if (v1 == "kebili") {
      ka = 33.705738160480436;
      ki = 8.97033666112151;
    }
    if (v1 == "Tozeur") {
      ka = 33.925872674015096;
      ki = 8.135804954069513;
    }
    if (v1 == "Gafsa") {
      ka = 34.429298008142624;
      ki = 8.77520534987451;
    }
    if (v1 == "Sidi Bouzid") {
      ka = 35.038847954217296;
      ki = 9.488882182952734;
    }
    if (v1 == "Kasserine") {
      ka = 35.16843736384983;
      ki = 8.832320898944385;
    }
    if (v1 == "Kairouan") {
      ka = 35.67799459446539;
      ki = 10.098953435953941;
    }
    if (v1 == "Le Kef") {
      ka = 36.18029740609105;
      ki = 8.712276912366539;
    }
    if (v1 == "Siliana") {
      ka = 36.08666620763284;
      ki = 9.374942729675096;
    }
    if (v1 == "Jendouba") {
      ka = 36.505286532201;
      ki = 8.771338300641949;
    }
    if (v1 == "Béja") {
      ka = 36.733629567628405;
      ki = 9.180907307859487;
    }
    if (v1 == "Bizert") {
      ka = 37.28134116552768;
      ki = 9.861675371780404;
    }
    if (v1 == "Zaghouan") {
      ka = 36.40811507486881;
      ki = 10.132561281284852;
    }
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/im1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Recherche Des Professionnelles",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 170,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              padding: EdgeInsets.all(10),
              //width: size.width * 0.7,
              decoration: BoxDecoration(
                color: kPrimaryLigthColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton<Item>(
                hint: Text("Choisiez Une Ville"),
                value: selectedUser,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                isExpanded: true,
                style: TextStyle(color: Colors.deepPurple),
                onChanged: (
                  Item Value,
                ) {
                  setState(() {
                    selectedUser = Value;
                    v1 = selectedUser.name;
                  });
                },
                items: users.map((Item user) {
                  return DropdownMenuItem<Item>(
                    value: user,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          user.name,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              padding: EdgeInsets.all(10),
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
                isExpanded: true,
                style: TextStyle(color: Colors.deepPurple),
                onChanged: (Item1 Value1) {
                  setState(() {
                    selectedjob = Value1;
                    v2 = Value1.id;
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
            ),
            SizedBox(
              height: 20,
            ),

            /*Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text('Selected Item = ' + '$v1',
                    style: TextStyle(fontSize: 22, color: Colors.black))),*/

            butt(
              text: 'Chercher',
              col: Colors.teal,
              fcol: Colors.white,
              press: () {
                print(v1);
                if (v1 != null) {
                  print("ddddd");

                  res(v1);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Mapr(
                        k: ka,
                        k1: ki,
                        id: v2.toString(),
                      ),
                    ),
                  );
                } else {
                  Fluttertoast.showToast(
                      msg: "Champs vide",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

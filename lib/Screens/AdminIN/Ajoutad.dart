import 'dart:convert';
import 'dart:io';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mari/Screens/AdminIN/Admin.dart';
import 'package:mari/Screens/AdminIN/pos.dart';
import 'package:mari/Screens/Login/components/Text.dart';
import 'package:mari/Screens/Nav/Recherche/rech.dart';
import 'package:mari/components/roundbat.dart';
import 'package:mari/constant.dart';
import 'package:http/http.dart' as http;

class AjoutP extends StatefulWidget {
  final double a;
  final double b;

  final String c1;
  final String c2;
  final String c3;

  const AjoutP({Key key, this.a, this.b, this.c1, this.c2, this.c3})
      : super(key: key);
  @override
  _AjoutPState createState() => _AjoutPState();
}

class Item1 {
  const Item1(this.name, this.id);
  final String name;
  final int id;
}

Item1 selectedjob;

class _AjoutPState extends State<AjoutP> {
  double ka;
  double ki;
  Item holder;
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

  Item1 selectedjob;
  var v2;

  TextEditingController nom = new TextEditingController();
  TextEditingController Titre = new TextEditingController();
  TextEditingController Contenu = new TextEditingController();
  TextEditingController Adresse = new TextEditingController();
  TextEditingController Telephone = new TextEditingController();
  TextEditingController Emplacement = new TextEditingController();
  TextEditingController Site = new TextEditingController();
  DateTime selectedDate;
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future upload(String formattedDate) async {
    try {
      final uri = Uri.parse("http://192.168.43.32/app/ajouterp.php");
      var req = http.MultipartRequest('POST', uri);
      req.fields['name'] = nom.text;
      req.fields['Titre'] = Titre.text;
      req.fields['Contenu'] = Contenu.text;
      req.fields['date'] = formattedDate;
      req.fields['Emplacement'] = Emplacement.text;
      req.fields['Site'] = Site.text;
      req.fields['Adresse'] = v1;
      req.fields['Telephone'] = Telephone.text;
      req.fields['cat'] = v2.toString();

      var pic = await http.MultipartFile.fromPath("image", _image.path);
      req.files.add(pic);
      var res = await req.send();
      if (res.statusCode == 200) {
        // print(_image);
        print("image ok");
      } else {
        print("no");
      }
    } catch (e) {
      print(e);
    }
  }

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

  Future Ajouter(String formattedDate) async {
    try {
      var url = "http://192.168.43.32/app/ajouterp.php";
      var response = await http.post(url, headers: {
        "Accept": "application/json"
      }, body: {
        "nom": nom.text,
        "Titre": Titre.text,
        "Contenu": Contenu.text,
        "date": formattedDate,
        "Telephone": Telephone.text,
        "Emplacement": Emplacement.text.replaceAll(' ', ''),
        "Site": Site.text,
        "Adresse": v1,
      });

      //print(nom.text);
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

  aff() {
    //print(nh + th + ch);
    nom.text = widget.c1;
    Titre.text = widget.c2;
    Contenu.text = widget.c3;
  }

  @override
  Widget build(BuildContext context) {
    if (nom.text == null) {
      //print("ddd");
      Emplacement.text = ("");
    } else {
      aff();
    }
    if (widget.a == null) {
      //print("ddd");
      Emplacement.text = ("");
    } else {
      Emplacement.text = (widget.a.toString() + ", " + widget.b.toString());
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Ajouter un Partenaire "),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Roundt(
              con: nom,
              m: 1,
              mi: 1,
              hintText: "Le nom ",
              icon: Icons.person,
            ),
            Roundt(
              con: Titre,
              hintText: "Titre ",
              m: 2,
              mi: 2,
              icon: Icons.list_alt_sharp,
            ),
            Roundt(
              con: Contenu,
              hintText: "Contenu",
              m: 4,
              mi: 4,
              icon: Icons.content_paste,
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
                icon: Icon(Icons.arrow_downward_sharp),
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
            Roundt(
                con: Emplacement,
                a: TextInputType.number,
                m: 1,
                mi: 1,
                hintText: "Emplacement ",
                icon: Icons.location_on_outlined,
                tap: () {
                  res(v1);
                  if ((ka == null) || (ki == null)) {
                    Fluttertoast.showToast(
                        msg: "Choisir une ville",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Pos(
                          la: ka,
                          lg: ki,
                          id: 1,
                          no: nom.text,
                          tio: Titre.text,
                          co: Contenu.text,
                        ),
                      ),
                    );
                  }
                }),
            Roundt(
              con: Telephone,
              m: 1,
              mi: 1,
              hintText: "Télephone ",
              a: TextInputType.number,
              icon: Icons.phone,
            ),
            Roundt(
              con: Site,
              m: 1,
              mi: 1,
              hintText: "Site Web ",
              icon: Icons.web,
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                padding: EdgeInsets.all(10),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: kPrimaryLigthColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(children: [
                  Flexible(
                      child: Padding(
                    padding: EdgeInsets.only(left: 50.0, right: 50.0),
                    child: TextButton(
                      child: Text(
                        "Ajouter un logo",
                        style: TextStyle(fontSize: 15, color: kPrimarycolor),
                      ),
                      onPressed: () {
                        getImage();
                      },
                    ),
                  )),
                  _image == null
                      ? Text('No image selected.')
                      : CircleAvatar(
                          backgroundImage: FileImage(_image),
                          radius: 30,
                        ),
                ])),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              padding: EdgeInsets.all(10),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kPrimaryLigthColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50.0),
                child: DateTimeField(
                    decoration: const InputDecoration(
                        hintText: '  Date de fin de l’offre',
                        hintStyle: TextStyle(
                            fontSize: 15,
                            color: kPrimarycolor,
                            fontWeight: FontWeight.bold)),
                    selectedDate: selectedDate,
                    onDateSelected: (DateTime value) {
                      setState(() {
                        selectedDate = value;
                      });
                    }),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                butt(
                  col: Colors.green,
                  text: "Ajouter",
                  press: () {
                    try {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd HH:mm').format(selectedDate);

                      if ((nom.text == "") ||
                          (Titre.text == "") ||
                          (Contenu.text == "") ||
                          (Telephone.text == "") ||
                          (Emplacement.text == "") ||
                          (Site.text == "")) {
                        Fluttertoast.showToast(
                            msg: "il y a un champ vide",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        upload(formattedDate);

                        Fluttertoast.showToast(
                            msg: "Trés bien",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        Site.text == "";
                        Emplacement.text == "";
                        Telephone.text == "";
                        Contenu.text == "";
                        Titre.text == "";
                        nom.text == "";
                      }
                    } catch (e) {
                      Fluttertoast.showToast(
                          msg: "il y a un champ vide",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                butt(
                  col: Colors.red,
                  text: "Retour",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Admin(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

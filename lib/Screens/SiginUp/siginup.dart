import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:mari/Screens/Home/Map/map1/main.dart';
import 'package:mari/Screens/Login/components/Text.dart';
import 'package:mari/Screens/Nav/Nav.dart';

import 'package:mari/components/roundbat.dart';
import 'package:mari/constant.dart';

class Siginup extends StatefulWidget {
  @override
  _SiginupState createState() => _SiginupState();
}

class _SiginupState extends State<Siginup> {
  TextEditingController em = new TextEditingController();
  TextEditingController pa = new TextEditingController();
  TextEditingController nom = new TextEditingController();

  Future sign() async {
    try {
      final respone = await http.post("http://192.168.43.32/app/inscri.php",
          headers: {"Accept": "application/json"},
          body: {"name": nom.text, "email": em.text, "pass": pa.text});
      print("r");
      var data = json.decode(respone.body);
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Navi(),
          ),
        );
      } else if (data == "error") {
        Fluttertoast.showToast(
            msg: "Le copmte est deja existé",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      print('error caught: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // StatusBar.color(Colors.black);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              "Inscription",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            Roundt(
              hintText: "Nom",
              con: nom,
              icon: Icons.person,
            ),
            Roundt(
              hintText: "E-mail",
              con: em,
              icon: Icons.email,
            ),
            Roundt(
              hintText: "Mot de Passe",
              con: pa,
              icon: Icons.lock,
            ),
            butt(
              text: "Inscription",
              col: vert,
              press: () {
                if (em.text == "" || pa.text == "" || nom.text == "") {
                  Fluttertoast.showToast(
                      msg: "les champs sont vides",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else {sign();}
                
              },
            )
          ],
        ),
      ),
    ));
  }
}

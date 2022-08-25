import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:convert';

import 'dart:async';
import 'package:flutter_svg/svg.dart';
import 'package:mari/Screens/AdminIN/Admin.dart';
import 'package:mari/Screens/AdminIN/parte.dart';

import 'package:mari/Screens/Login/components/Text.dart';
import 'package:mari/Screens/Nav/Nav.dart';
import 'package:mari/components/roundbat.dart';
import 'package:mari/constant.dart';

import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController em = new TextEditingController();
  TextEditingController pa = new TextEditingController();

  Future login() async {
    try {
      var response = await http.post("http://192.168.43.32/app/login.php",
          headers: {"Accept": "application/json"},
          body: {"email": em.text, "pass": pa.text});
      print("dddd");
      var data = json.decode(response.body);
      print(data);

      if (data == "Success") {
        pa.clear();
        em.clear();
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
      } else {
        Fluttertoast.showToast(
            msg: "Verifer vos coordonnées",
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset(
            "assets/icons/login.svg",
            height: size.height * 0.35,
          ),
          Roundt(
            hintText: "E-mail",
            con: em,
            icon: Icons.mail,
          ),
          Roundt(
            hintText: "Mot de Passe",
            con: pa,
            icon: Icons.lock,
          ),
          butt(
            col: vert,
            text: "Connecter",
            press: () {
              // login();
              /*  if (em.text == "a") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Navi(),
                  ),
                );
              } else if (em.text == "p") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => par(),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Admin(),
                  ),
                );
              }*/
              if (em.text == "" || pa.text == "") {
                Fluttertoast.showToast(
                    msg: "les champs sont vides",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else if (em.text == "admin" && pa.text == "admin") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Admin(),
                  ),
                );
              } else {
                login();
              }
            },
          ),
        ],
      ),
    ));
  }
}

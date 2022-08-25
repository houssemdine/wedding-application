import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mari/Screens/AdminIN/Modifier.dart';
import 'package:mari/Screens/Nav/Nav.dart';
import 'package:mari/components/roundbat.dart';

class par extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<par> {
  String nom;
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Partenaire",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text("    GESTION DES PARTENAIRES",
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.teal,
                    )),
                SizedBox(
                  height: 100,
                ),
                SizedBox(
                  height: 25,
                ),
                butt(
                  text: "Modifier un Partenaire",
                  col: Colors.teal,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Modif(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 25,
                ),
                butt(
                  text: "Page de recherche",
                  col: Colors.blueAccent,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Navi(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

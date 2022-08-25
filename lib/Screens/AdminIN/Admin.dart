import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:mari/Screens/AdminIN/Ajoutad.dart';
import 'package:mari/Screens/AdminIN/Modifier.dart';

import 'package:mari/Screens/AdminIN/supp.dart';

import 'package:mari/Screens/Nav/Nav.dart';
import 'package:mari/components/roundbat.dart';

class Admin extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<Admin> {
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
          "Administration",
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            butt(
              text: "Ajouter un Partenaire",
              col: Colors.teal,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AjoutP(),
                  ),
                );
              },
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
            butt(
              text: "Supprimer un Partenaire",
              col: Colors.teal,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => supp(),
                  ),
                );
              },
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
      ))),
    );
  }
}

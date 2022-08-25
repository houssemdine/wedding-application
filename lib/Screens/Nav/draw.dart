import 'package:flutter/material.dart';
import 'package:mari/Screens/Welcome/Welcom.dart';



class drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: <Widget>[
      Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 100.00,
              child: DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Mariage',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                  )),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ListTile(
                    title: Text("Déconnexion", style: TextStyle(fontSize: 20)),
                    leading: Icon(Icons.outbond),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Welcome(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text("Paramètre", style: TextStyle(fontSize: 20)),
                    leading: Icon(Icons.settings),
                    onTap: null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}



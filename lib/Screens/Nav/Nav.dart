import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mari/Screens/Home/Map/map1/main.dart';
import 'package:mari/Screens/Nav/Budget/budjet.dart';
import 'package:mari/Screens/Nav/Recherche/rech.dart';
import 'package:mari/Screens/Nav/appb.dart';
import 'package:mari/Screens/Nav/draw.dart';
import 'package:mari/Screens/Nav/invit%C3%A9/invi.dart';

import '../../events/events.dart';

class Navi extends StatefulWidget {
  @override
  _NaviState createState() => _NaviState();
}

class _NaviState extends State<Navi> {
  int _selectindex = 0;
  String _title;

  static List<Widget> _option = <Widget>[
    Rech(),
    TestApp(),
    Budjet(),
    Invi(),
    event()
  ];
  void _ontap(int index) {
    setState(() {
      _selectindex = index;
      switch (index) {
        case 0:
          {
            _title = 'Recherche';
          }
          break;
        case 1:
          {
            _title = 'Les partenaire';
          }
          break;
        case 2:
          {
            _title = 'Liste des budget';
          }
          break;
        case 3:
          {
            _title = 'Liste des invitées';
          }
          break;
        case 4:
          {
            _title = 'Planifiez votre mariage';
          }
          break;
      }
    });
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
    //todos.add('1  DT');
    _title = "Recherche";

    //get();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          key: navigatorKey,
          appBar: AppBar(
            title: Text(
              _title,
              style: TextStyle(color: Colors.white),
              
            ),
            
            backgroundColor: Colors.teal,
          ),
          drawer: drawer(),
          body: _option[_selectindex] ,
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.search),
                label: 'MAP',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'MAP',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet),
                label: 'hom',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(Icons.group_outlined),
                label: 'hom',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(Icons.event),
                label: 'hom',
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectindex,
            onTap: _ontap,
            unselectedFontSize: 0.0,
            selectedFontSize: 0.0,
            selectedItemColor: Colors.pink,
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.teal,
            elevation: 0.0,
            iconSize: 30,
          ),
    );
  }
}

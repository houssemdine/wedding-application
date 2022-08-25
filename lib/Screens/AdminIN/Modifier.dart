import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mari/Screens/AdminIN/Admin.dart';
import 'package:mari/Screens/AdminIN/mod.dart';

class Modif extends StatefulWidget {
  @override
  _ModifState createState() => _ModifState();
}

/*class art {
  int ID;
  String post_title;
  String post_name;
  art({this.ID, this.post_title, this.post_name});

  factory art.fromJson(Map<String, dynamic> json) {
    return art(
      ID: json['id'] as int,
      post_title: json['post_title'] as String,
      post_name: json['post_name'] as String,
    );
  }
}*/

class _ModifState extends State<Modif> {
  List all = List();

  Future getall() async {
    var response = await http.get("http://192.168.43.32/app/getall.php");
    if (response.statusCode == 200) {
      if (this.mounted) {
        // check whether the state object is in tree
        setState(() {
          all = jsonDecode(response.body);
        });
      }
      //print(all);
      return all;
    }
  }

  @override
  void initState() {
    super.initState();
    getall();
  }

  @override
  void dispose() {
    getall();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getall();
    return Scaffold(
        appBar: AppBar(
          title: Text('    Modifer un Partenaire'),
          backgroundColor: Colors.teal,
        ),
        body: ListView.builder(
            itemCount: all.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(all[index]['ID']),
                trailing: Text(all[index]['post_title']),
                onTap: () {
                  //print(all);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => mod(id: all[index]['ID']),
                    ),
                  );
                },
              );
            }));
  }
}

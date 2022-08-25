import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class res extends StatefulWidget {
  final int id;

  const res({Key key, this.id}) : super(key: key);
  @override
  _resState createState() => _resState();
}

class _resState extends State<res> {
  List todos = List();
  List todos1 = List();
  List todos2 = List();
  Future get() async {
    try {
      var url = "http://192.168.43.32/app/get_par.php";
      var response = await http.post(url, headers: {
        "Accept": "application/json"
      }, body: {
        "id": widget.id.toString(),
      });

      if (response.statusCode == 200) {
        if (this.mounted) {
          // check whether the state object is in tree
          setState(() {
            todos1 = jsonDecode(response.body);
          });
        }
        //print(todos1);
        return todos1;
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: "Aucun Partenaire",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  void initState() {
    super.initState();
    //todos.add('1  DT');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      get();
    });
    //get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Flexible(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: todos1.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(todos1[index]['ID']),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () {
                        get();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => res(
                              id: 80,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        shadowColor: Colors.teal,
                        elevation: 14,
                        margin: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: ListTile(
                          title: Text(todos1[index]['post_title'] +
                              "\n" +
                              todos1[index]['meta_value']),
                        ),
                      ),
                    ),
                  ]),
                );
              }),
        ),
      ],
    ));
  }
}

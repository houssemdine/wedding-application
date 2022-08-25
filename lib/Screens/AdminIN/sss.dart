import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mari/Screens/Login/components/Text.dart';
import 'package:mari/components/roundbat.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
          child: Row(children: [
        TextButton(
          child: Text("Ajouter un logo"),
          onPressed: () {
            getImage();
          },
        ),
        _image == null
            ? Text('No image selected.')
            : CircleAvatar(
                backgroundImage: FileImage(_image),
                radius: 40,
              ),
      ])),
      /* floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),*/
    );
  }
}
/* itemCount: all.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(all[index]['ID']),
              title: Text(all[index]['post_title']),
              subtitle: Text(all[index]['post_name']),
              onTap: () {},
            );
          } */



          
          /*DataTable(
          columns: [
            DataColumn(label: Text('RollNo')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Class')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Arya')),
              DataCell(Text('6')),
            ]),
            DataRow(cells: [
              DataCell(Text('12')),
              DataCell(Text('John')),
              DataCell(Text('9')),
            ]),
            DataRow(cells: [
              DataCell(Text('42')),
              DataCell(Text('Tony')),
              DataCell(Text('8')),
            ]),
          ],
        ), */
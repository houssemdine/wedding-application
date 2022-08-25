import 'package:flutter/material.dart';

//class Rountbat extends StatelessWidget {

/*class Rountbat extends StatelessWidget {
  final String text;
  final Function press;
  final color, textecolor;
  const Rountbat({
    Key key,
    this.text,
    this.press,
    this.color = kPrimarycolor,
    this.textecolor = Colors.white,
  }) : super(key: key);*/

/* @override
  Widget build(BuildContext context) {
    Color c = const Color(0xFF42A5F5);
    Padding p = Padding(padding: EdgeInsets.all(20));

    return TextButton(
        Key key,
       @required VoidCallback onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kPrimarycolor),
          ),
      onPressed: () {

      },
      child: Text(text),
    );*/
//}

class butt extends StatelessWidget {
  final String text;
  final Function press;
  final Color col;
  final Color fcol;

  const butt({Key key, this.press, this.text, this.col, this.fcol})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      onPressed: press,
      style: TextButton.styleFrom(
        backgroundColor: col,
        primary: fcol,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 1),
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
      ),
    );
  }
}

/*TextButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 1),
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
      ), */
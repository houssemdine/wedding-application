import 'package:flutter/material.dart';

import '../../../constant.dart';

class Roundt extends StatelessWidget {
  final TextEditingController con;
  final String hintText;
  final IconData icon;
  final a;
  final int m;
  final int mi;
  final Function tap;
  final e;
  final ValueChanged<String> onChange;
  const Roundt({
    Key key,
    this.hintText,
    this.icon,
    this.onChange,
    this.con,
    this.a,
    this.m,
    this.mi,
    this.tap,
    this.e,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldcon(
      child: TextField(
        controller: con,
        onChanged: onChange,
        keyboardType: a,
        maxLines: m,
        minLines: mi,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: kPrimarycolor,
            ),
            hintText: hintText),
        onTap: tap,
        enabled: e,
      ),
    );
  }
}

class TextFieldcon extends StatelessWidget {
  final Widget child;

  const TextFieldcon({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      padding: EdgeInsets.all(10),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLigthColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}

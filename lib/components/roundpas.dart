import 'package:flutter/material.dart';
import 'package:mari/Screens/Login/components/Text.dart';


import '../constant.dart';

class Pass extends StatelessWidget {
  final TextEditingController con;
  final ValueChanged<String> onchanged;
  const Pass({
    Key key,
    this.onchanged,
    this.con,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldcon(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Mot de passe",
          icon: Icon(
            Icons.lock,
            color: kPrimarycolor,
          ),
        ),
      ),
    );
  }
}

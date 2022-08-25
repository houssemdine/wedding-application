import 'package:flutter/material.dart';
import 'package:mari/Screens/Welcome/Components/body.dart';


class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Body(),
    ));
  }
}

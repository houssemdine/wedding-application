import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mari/Screens/Login/login.dart';
import 'package:mari/Screens/SiginUp/siginup.dart';
import 'package:mari/components/roundbat.dart';

import 'package:mari/constant.dart';

import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bienvenue",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.6,
            ),
            butt(
                col: kPrimarycolor,
                text: "  Connecter ",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Login();
                      },
                    ),
                  );
                }),
            butt(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Siginup();
                    },
                  ),
                );
              },
              text: "Inscription",
              col: kPrimarycolor,
            ),
          ],
        ),
      ),
    );
  }
}

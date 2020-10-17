import 'package:flutter/material.dart';
import 'package:logapp/screen/authenticate/Sign_in.dart';
import 'package:logapp/screen/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool viewListerner = true;

  void toggleView() {
    setState(() {
      viewListerner = !viewListerner;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (viewListerner) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}

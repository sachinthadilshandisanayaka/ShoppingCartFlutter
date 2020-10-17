import 'package:flutter/material.dart';
import 'package:logapp/services/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Center(
          child: Text(
            'Register',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 50.0,
            ),
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      print(password);
                      print(email);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

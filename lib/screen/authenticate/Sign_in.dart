import 'package:flutter/material.dart';
import 'package:logapp/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Center(
          child: Text(
            'Sign In',
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
            child: RaisedButton(
              onPressed: () async {
                dynamic result = await _auth.signInAnon();
                if (result == null) {
                  print('error signin in');
                } else {
                  print('Sign in');
                  print(result.uid);
                }
              },
              child: Text('Sign in anon'),
            ),
          ),
        ),
      ),
    );
  }
}

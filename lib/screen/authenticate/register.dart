import 'package:flutter/material.dart';
import 'package:logapp/services/auth.dart';
import 'package:logapp/shared/constant.dart';
import 'package:logapp/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 2,
              title: Text(
                'Register',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    widget.toggleView();
                  },
                  label: Text('sign in'),
                ),
              ],
            ),
            body: SafeArea(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 50.0,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: registerTextInputDecoration.copyWith(
                              hintText: 'Email'),
                          validator: (value) => value.isEmpty
                              ? 'Text field shoul not be empty'
                              : null,
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
                          decoration: registerTextInputDecoration.copyWith(
                              hintText: 'Password'),
                          validator: (value) => value.length < 6
                              ? 'Char count shoulb be +6'
                              : null,
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
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'please supply a valid email';
                                  loading = false;
                                });
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          error,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14.0,
                          ),
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

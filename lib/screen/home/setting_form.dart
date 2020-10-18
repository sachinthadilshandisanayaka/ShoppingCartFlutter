import 'package:flutter/material.dart';
import 'package:logapp/models/user.dart';
import 'package:logapp/services/database.dart';
import 'package:logapp/shared/constant.dart';
import 'package:logapp/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<int> quantity = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  String _currentName;
  String _currentPrice;
  int _currentQuantity;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);

    return StreamBuilder<UserData>(
        stream: DataBaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your item settings',
                    style: TextStyle(
                      fontSize: 19.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) {
                      setState(() {
                        _currentName = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: userData.price,
                    decoration: textInputDecoration.copyWith(hintText: 'Price'),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a price' : null,
                    onChanged: (val) {
                      setState(() {
                        _currentPrice = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //drop down
                  DropdownButtonFormField(
                    decoration: textInputDecoration,
                    value: _currentQuantity ?? userData.quantity,
                    items: quantity.map((val) {
                      return DropdownMenuItem(
                        value: val,
                        child: Text('$val items'),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _currentQuantity = val;
                      });
                    },
                  ),
                  RaisedButton(
                    color: Colors.pink[400],
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await DataBaseService(uid: user.uid).updateUserData(
                          _currentName ?? userData.name,
                          _currentPrice ?? userData.price,
                          _currentQuantity ?? userData.quantity,
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}

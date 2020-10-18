import 'package:flutter/material.dart';
import 'package:logapp/shared/constant.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<int> quantity = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  String _currentName;
  String _currentPrice;
  String _currentQuantity;
  @override
  Widget build(BuildContext context) {
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
            decoration: textInputDecoration.copyWith(hintText: 'Name'),
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
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
            decoration: textInputDecoration.copyWith(hintText: 'Price'),
            validator: (val) => val.isEmpty ? 'Please enter a price' : null,
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
            value: _currentQuantity ?? 0,
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
            onPressed: () {
              print(_currentName);
              print(_currentPrice);
              print(_currentQuantity);
            },
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

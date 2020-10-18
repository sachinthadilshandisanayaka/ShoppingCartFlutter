import 'package:flutter/material.dart';
import 'package:logapp/models/item.dart';
import 'package:logapp/screen/home/item_list.dart';
import 'package:logapp/services/auth.dart';
import 'package:logapp/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Text(
                'bottom sheet',
              ),
            );
          });
    }

    return StreamProvider<List<Item>>.value(
      value: DataBaseService().items,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Disa Yka',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 1.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Log out'),
            ),
            FlatButton.icon(
              onPressed: () {
                _showSettingPanel();
              },
              icon: Icon(Icons.settings),
              label: Text(''),
            ),
          ],
        ),
        body: ItemList(),
      ),
    );
  }
}

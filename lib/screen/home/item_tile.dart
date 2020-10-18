import 'package:flutter/material.dart';
import 'package:logapp/models/item.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  ItemTile({this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('assets/c.png'),
          ),
          title: Text(item.name),
          subtitle: Text(
            'price : ${item.price}  Quantity :${item.quantity}',
          ),
        ),
      ),
    );
  }
}

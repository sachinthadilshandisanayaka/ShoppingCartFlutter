import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logapp/models/item.dart';

class DataBaseService {
  final String uid;
  DataBaseService({this.uid});
  // collection reference
  final CollectionReference itemCollection =
      FirebaseFirestore.instance.collection('items');

  Future updateUserData(String name, String price, int quantity) async {
    return await itemCollection.doc(uid).set({
      'item_name': name,
      'item_price': price,
      'quantity': quantity,
    });
  }

  // item list from snapshot
  List<Item> _itemListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Item(
        name: doc.data()['item_name'].toString(),
        price: doc.data()['item_price'].toString(),
        quantity: doc.data()['quantity'],
      );
    }).toList();
  }

  // get items stream
  Stream<List<Item>> get items {
    return itemCollection.snapshots().map(_itemListFromSnapshot);
  }
}

// ignore_for_file: non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModelResturant {
  String? user_id;
  String? resturant_id;
  int? amount;
  int? totalprice;

  OrderModelResturant({
    this.user_id,
    this.resturant_id,
    this.amount,
    this.totalprice,
  });

  OrderModelResturant.fromDocumentSnapshot(DocumentSnapshot doc) {
    user_id = doc['user_id'];
    resturant_id = doc['resturant_id'];
    amount = doc['amount'];
    totalprice = doc['totalprice'];
  }
}

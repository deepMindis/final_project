// ignore_for_file: non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModelServices {
  String? user_id;
  String? Service_ID;
  int? amount;
  int? totalprice;

  OrderModelServices({
    this.user_id,
    this.Service_ID,
    this.amount,
    this.totalprice,
  });

  OrderModelServices.fromDocumentSnapshot(DocumentSnapshot doc) {
    user_id = doc['user_id'];
    Service_ID = doc['Service_ID'];
    amount = doc['amount'];
    totalprice = doc['totalprice'];
  }
}

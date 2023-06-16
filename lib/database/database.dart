import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:kraba/model/order_resturant_model.dart';
import 'package:kraba/model/order_services_model.dart';

class Database {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> createNewOrderServices(OrderModelServices order) async {
    try {
      await firestore.collection('services').doc(order.user_id).set({
        "user_id": order.user_id,
        "Service_ID": order.Service_ID,
        "amount": order.amount,
        "totalprice": order.totalprice
      });
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return true;
    }
  }

  Future<bool> createNewOrderResturant(OrderModelResturant order) async {
    try {
      await firestore.collection('services').doc(order.user_id).set({
        "user_id": order.user_id,
        "resturant_id": order.resturant_id,
        "amount": order.amount,
        "totalprice": order.totalprice
      });
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return true;
    }
  }
}

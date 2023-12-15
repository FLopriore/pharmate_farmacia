import 'package:flutter/cupertino.dart';
import 'package:pharmate_farmacia/data/api.dart';
import 'package:pharmate_farmacia/data/order.dart';

class History with ChangeNotifier {
  List<Order> listHistoryOrders = [];

  History() {
    getHistoryOrders();
  }

  void getHistoryOrders() async {
    var responseJson = await CallApi().getData('ordine/farmacia?status=DELIVERED');
    if (responseJson != null) {
      List<Order> history = List<Order>.from(
          responseJson.map((model) => Order.fromJson(model)));
      listHistoryOrders = history;
      notifyListeners();
    }
  }
}
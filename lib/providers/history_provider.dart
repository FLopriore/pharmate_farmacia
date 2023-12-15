import 'package:flutter/cupertino.dart';
import 'package:pharmate_farmacia/data/api.dart';
import 'package:intl/intl.dart'; // for date format
import 'package:intl/date_symbol_data_local.dart';
import 'package:pharmate_farmacia/data/order.dart';

class History with ChangeNotifier {
  List<Order> listHistoryOrders = [];

  History() {
    getHistoryOrders();
    //sortHistoryDate(getDates(listHistoryOrders));
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
/*
  void sortHistoryDate(List<String> dates){
    dates.sort((a,b){
      return DateTime.parse(a).compareTo(DateTime.parse(b));
    });
  }

  List<String> getDates(List<Order> listOrders){
      List<String> l = [];
      for (var i = 0; i < listHistoryOrders.length;i++){
        l.add(listHistoryOrders[i].date);
      }
      return l;
  }*/
}
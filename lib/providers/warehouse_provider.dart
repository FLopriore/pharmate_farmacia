import 'package:flutter/cupertino.dart';
import 'package:pharmate_farmacia/data/api.dart';
import 'package:pharmate_farmacia/data/medicine.dart';

class Warehouse with ChangeNotifier {
  List<Medicine> listItemsWarehouse = [];

  Warehouse() {
    getWarehouseItems();
  }

  void getWarehouseItems() async {
    var responseJson = await CallApi().getData('magazzino');
    if (responseJson != null) {
      List<Medicine> warehouse = List<Medicine>.from(
          responseJson.map((model) => Medicine.fromJson(model)));
      listItemsWarehouse = warehouse;
      notifyListeners();
    }
  }

  void addItemToStock(String codeItem, String qta) async {
    var data = {
      'codeItem': codeItem,
      'qta': int.parse(qta),
      // TODO: add pharmacy code and medicine name
    };
    var response = await CallApi().postData(data, 'magazzino');
    if (response != null) {
      getWarehouseItems();
    }
  }
}

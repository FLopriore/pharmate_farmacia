import 'package:flutter/cupertino.dart';
import 'package:pharmate_farmacia/data/api.dart';
import 'package:pharmate_farmacia/data/medicine.dart';

class Warehouse with ChangeNotifier {
  List<Medicine> listItemsWarehouse = [];

  Warehouse() {
    getWarehouseItems();
  }

  void getWarehouseItems() async {
    var responseJson = await CallApi().getData('farmacie/giacenza');
    if (responseJson != null) {
      List<Medicine> warehouse = List<Medicine>.from(
          responseJson.map((model) => Medicine.fromJson(model)));
      listItemsWarehouse = warehouse;
      notifyListeners();
    }
  }

  void addItemToStock(String codiceAic, String qta) async {
    var response = await CallApi()
        .postData("", 'farmacie/giacenza/$codiceAic?differenza=$qta');
    if (response != null) {
      getWarehouseItems();
    }
  }
}

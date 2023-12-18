import 'package:flutter/cupertino.dart';
import 'package:pharmate_farmacia/data/api.dart';
import 'package:pharmate_farmacia/data/warehouse_item.dart';
import 'package:pharmate_farmacia/json_useful_fields.dart';

class Warehouse with ChangeNotifier {
  List<WarehouseItem> listItemsWarehouse = [];

  Warehouse() {
    getWarehouseItems();
  }

  void getWarehouseItems() async {
    var responseJson = await CallApi().getData('farmacie/giacenza');
    var modResponseJson = JsonUsefulFields.getWarehouseItems(responseJson);
    if (modResponseJson.isNotEmpty) {
      List<WarehouseItem> warehouse = List<WarehouseItem>.from(
          modResponseJson.map((model) => WarehouseItem.fromJson(model)));
      listItemsWarehouse = warehouse;
      notifyListeners();
    }
  }

  void addItemToStock(String codiceAic, String qta) async {
    var response = await CallApi()
        .postData("", 'farmacie/giacenza/$codiceAic?differenza=$qta');
    if (response) {
      getWarehouseItems();
    }
  }
}

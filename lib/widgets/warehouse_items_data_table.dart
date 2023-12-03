import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/data/api.dart';
import 'package:pharmate_farmacia/data/medicine.dart';

class WarehouseItemsDataTable extends StatefulWidget {
  const WarehouseItemsDataTable({super.key});

  @override
  State<WarehouseItemsDataTable> createState() =>
      _WarehouseItemsDataTableState();
}

class _WarehouseItemsDataTableState extends State<WarehouseItemsDataTable> {
  late Future<List<Medicine>> warehouseItemsList;

  @override
  void initState() {
    super.initState();
    warehouseItemsList = getWarehouseItems();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Medicine>>(
      future: warehouseItemsList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DataTable(
              sortColumnIndex: 0,
              sortAscending: true,
              columns: const [
                DataColumn(
                  label: Text("Codice AIC",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  numeric: true,
                ),
                DataColumn(
                    label: Text("Nome",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(
                  label: Text("Qtà",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  numeric: true,
                ),
              ],
              rows: List<DataRow>.generate(
                  snapshot.data!.length,
                  (int index) => DataRow(cells: <DataCell>[
                        DataCell(Text(snapshot.data![index].codeItem)),
                        DataCell(Text(snapshot.data![index].name)),
                        DataCell(Text(snapshot.data![index].qta.toString())),
                      ])));
        } else if (snapshot.hasError) {
          return Container(color: const Color(0xFFF1F1EA));
        }

        // By default, show a blank Scaffold.
        return const Scaffold(backgroundColor: Color(0xFFF1F1EA));
      },
    );
  }

  Future<List<Medicine>> getWarehouseItems() async {
    var responseJson = await CallApi().getData('magazzino');
    List<Medicine> warehouse = List<Medicine>.from(
        responseJson.map((model) => Medicine.fromJson(model)));
    return warehouse;
  }
}

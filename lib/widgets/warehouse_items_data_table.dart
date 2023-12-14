import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/providers/warehouse_provider.dart';
import 'package:provider/provider.dart';

class WarehouseItemsDataTable extends StatefulWidget {
  const WarehouseItemsDataTable({super.key});

  @override
  State<WarehouseItemsDataTable> createState() =>
      _WarehouseItemsDataTableState();
}

class _WarehouseItemsDataTableState extends State<WarehouseItemsDataTable> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Warehouse>(
      builder: (context, warehouse, child) => DataTable(
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
            /* DataColumn(
              label: Text("Qtà", style: TextStyle(fontWeight: FontWeight.bold)),
              numeric: true,
            ),*/
          ],
          rows: List<DataRow>.generate(
              warehouse.listItemsWarehouse.length,
              (int index) => DataRow(cells: <DataCell>[
                    DataCell(Text(warehouse.listItemsWarehouse[index].aic)),
                    DataCell(Text(warehouse.listItemsWarehouse[index].nome)),
                    // TODO: get available quantity from warehouse
                    //DataCell(Text(warehouse.listItemsWarehouse[index].qta.toString())),
                  ]))),
    );
  }
}

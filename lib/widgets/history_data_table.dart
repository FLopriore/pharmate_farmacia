import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/providers/history_provider.dart';
import 'package:provider/provider.dart';

class HistoryDataTable extends StatefulWidget {
  const HistoryDataTable({super.key});

  @override
  State<HistoryDataTable> createState() =>
      _HistoryDataTableState();
}

class _HistoryDataTableState extends State<HistoryDataTable> {
  @override
  Widget build(BuildContext context) {
    return Consumer<History>(
      builder: (context, history, child) => DataTable(
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
            DataColumn(
              label: Text("Data", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text("Prezzo", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
          rows: List<DataRow>.generate(
              history.listHistoryOrders.length,
              (int index) => DataRow(cells: <DataCell>[
                    DataCell(Text(history.listHistoryOrders[index].prodotto.aic)),
                    DataCell(Text(history.listHistoryOrders[index].prodotto.nome)),
                    DataCell(Text("${history.listHistoryOrders[index].quantita}")),
                    DataCell(Text(history.listHistoryOrders[index].date)),
                    DataCell(Text("${history.listHistoryOrders[index].prodotto.prezzo}")),
                  ]))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharmate_farmacia/data/api.dart';
import 'package:pharmate_farmacia/data/order.dart';
import 'package:pharmate_farmacia/json_useful_fields.dart';

class HistoryDataTable extends StatefulWidget {
  const HistoryDataTable({super.key});

  @override
  State<HistoryDataTable> createState() => _HistoryDataTableState();
}

class _HistoryDataTableState extends State<HistoryDataTable> {
  late Future<List<Order>> myOrdersList;
  DateFormat formatter = DateFormat().add_yMMMd();

  @override
  void initState() {
    super.initState();
    myOrdersList = getHistoryOrders();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Order>>(
      future: myOrdersList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: FittedBox(
              alignment: Alignment.topCenter,
              child: DataTable(
                  sortColumnIndex: 0,
                  sortAscending: false,
                  dataRowMinHeight: 40.0,
                  columns: const [
                    DataColumn(
                      label: Text("Data",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      numeric: true,
                    ),
                    DataColumn(
                        label: Text("Codice Prodotto",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text("Prodotto",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                      label: Text("Qtà",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      numeric: true,
                    ),
                    DataColumn(
                        label: Text("Stato",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: List<DataRow>.generate(
                      snapshot.data!.length,
                      (int index) => DataRow(cells: <DataCell>[
                            DataCell(Text(formatter.format(DateTime.parse(snapshot.data![index].date)))),
                            DataCell(Text(snapshot.data![index].prodotto.codice_aic)),
                            DataCell(ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 150),
                              child: Text(
                                snapshot.data![index].prodotto.nome,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                            DataCell(Text(snapshot.data![index].quantita.toString())),
                            DataCell(Center(
                              child: Icon(
                                Icons.circle,
                                color: getStatusColor(snapshot.data![index].status),
                              ),
                            ))
                          ]))),
            ),
          );
        } else {
          return const Scaffold(
            backgroundColor: Color(0xFFF1F1EA),
            body: Center(child: Text("Non ci sono ordini")),
          );
        }
      },
    );
  }

  Color getStatusColor(Status status) {
    switch (status) {
      case Status.PENDING:
        return Colors.red;
      case Status.ACCEPTED:
        return Colors.yellow;
      case Status.DELIVERED:
        return Colors.green;
    }
  }

  // Gets all the orders done by the user.
  // After creating the 3 lists, returns the combined list with all of them.
  Future<List<Order>> getHistoryOrders() async {
    List<Order> myOrders = [];
    // Get delivered orders
    var response = await CallApi().getData('ordine/farmacia?status=DELIVERED');
    var modResponse = JsonUsefulFields.getPharmaOrders(response);
    if (modResponse.isNotEmpty) {
      myOrders = List<Order>.from(modResponse.map((model) => Order.fromJson(model)));
    }

    return myOrders;
  }
}
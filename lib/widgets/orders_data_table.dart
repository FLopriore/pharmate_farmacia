import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharmate_farmacia/data/api.dart';
import 'package:pharmate_farmacia/data/order.dart';
import 'package:pharmate_farmacia/json_useful_fields.dart';

class OrdersDataTable extends StatefulWidget {
  const OrdersDataTable({super.key});

  @override
  State<OrdersDataTable> createState() => _OrdersDataTableState();
}

class _OrdersDataTableState extends State<OrdersDataTable> {
  late Future<List<Order>> myOrdersList;
  DateFormat formatter = DateFormat().add_yMMMd();


  @override
  void initState() {
    super.initState();
    myOrdersList = getMyOrders();
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
                        label: Text("Codice AIC",
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
                    DataColumn(
                        label: Text("Azione",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: List<DataRow>.generate(
                      snapshot.data!.length,
                      (int index) => DataRow(cells: <DataCell>[
                            DataCell(Text(formatter.format(
                                DateTime.parse(snapshot.data![index].date)))),
                            DataCell(Text(
                                snapshot.data![index].prodotto.codice_aic)),
                            DataCell(Text(
                              snapshot.data![index].prodotto.nome,
                              overflow: TextOverflow.ellipsis,
                            )),
                            DataCell(Text(
                                snapshot.data![index].quantita.toString())),
                            DataCell(Center(
                              child: Icon(
                                Icons.circle,
                                color: _getStatusColor(
                                    snapshot.data![index].status),
                              ),
                            )),
                            DataCell(_getWidget(snapshot.data![index].status)),
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

  Color _getStatusColor(Status status) {
    switch (status) {
      case Status.PENDING:
        return Colors.red;
      case Status.ACCEPTED:
        return Colors.yellow;
      case Status.DELIVERED:
        return Colors.green;
    }
  }

  // Depending on the order status, returns different widgets.
  //
  // - Status.red: shows a button to accept the order and send a notification
  //   to the user
  // - Status.yellow: shows a button to confirm the item has been sold
  // - Status.green: shows a text that says the order is completed
  Widget _getWidget(Status status) {
    switch (status) {
      case Status.PENDING:
        return ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xff023D74),
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            // TODO: send notification to the user
            // TODO: set status to yellow
          },
          child: const Text("Accetta"),
        );
      case Status.ACCEPTED:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xff023D74),
            side: const BorderSide(
              color: Color(0xff023D74),
              width: 1.5,
              style: BorderStyle.solid,
            ),
          ),
          onPressed: () {
            // TODO: send notification to the user
            // TODO: set status to green
          },
          child: const Text("Vendi"),
        );
      case Status.DELIVERED:
        return const Text("Ordine completato");
    }
  }

  // Gets pending and accepted orders..
  // After creating the 2 lists, returns the combined list with all of them.
  Future<List<Order>> getMyOrders() async {
    List<Order> myOrders = [];

    // Get pending orders
    var response = await CallApi().getData('ordine/farmacia?status=PENDING');
    var modResponse = JsonUsefulFields.getPharmaOrders(response);
    if (modResponse.isNotEmpty) {
      myOrders =
          List<Order>.from(modResponse.map((model) => Order.fromJson(model)));
    }

    // Get accepted orders
    response = await CallApi().getData('ordine/farmacia?status=ACCEPTED');
    modResponse = JsonUsefulFields.getPharmaOrders(response);
    if (modResponse.isNotEmpty) {
      myOrders = myOrders +
          List<Order>.from(modResponse.map((model) => Order.fromJson(model)));
    }

    return myOrders;
  }
}

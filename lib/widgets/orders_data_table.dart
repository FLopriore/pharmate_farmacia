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
    return StreamBuilder<List<Order>>(
      stream: Stream.fromFuture(myOrdersList),
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
                      label: Text("ID ordine",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      numeric: true,
                    ),
                    DataColumn(
                      label: Text("Data",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      numeric: true,
                    ),
                    DataColumn(
                        label: Text("Codice AIC",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20))),
                    DataColumn(
                        label: Text("Prodotto",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20))),
                    DataColumn(
                      label: Text("Qtà",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      numeric: true,
                    ),
                    DataColumn(
                        label: Text("Stato",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20))),
                    DataColumn(
                        label: Text("Azione",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20))),
                  ],
                  rows: List<DataRow>.generate(
                      snapshot.data!.length,
                      (int index) => DataRow(cells: <DataCell>[
                            DataCell(ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 200),
                              child: Text(snapshot.data![index].uuid,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 20)),
                            )),
                            DataCell(Text(
                              formatter.format(
                                  DateTime.parse(snapshot.data![index].date)),
                              style: const TextStyle(fontSize: 20),
                            )),
                            DataCell(Text(
                                snapshot.data![index].prodotto.codice_aic,
                                style: const TextStyle(fontSize: 20))),
                            DataCell(Text(snapshot.data![index].prodotto.nome,
                                style: const TextStyle(fontSize: 20))),
                            DataCell(Text(
                                snapshot.data![index].quantita.toString(),
                                style: const TextStyle(fontSize: 20))),
                            DataCell(Center(
                              child: Icon(
                                Icons.circle,
                                color: _getStatusColor(
                                    snapshot.data![index].status),
                              ),
                            )),
                            DataCell(_getWidget(snapshot.data![index].status,
                                snapshot.data![index].uuid)),
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
  Widget _getWidget(Status status, String uuid) {
    switch (status) {
      case Status.PENDING:
        return ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xff023D74),
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            _acceptOrder(uuid);
          },
          child: const Text("Accetta", style: TextStyle(fontSize: 20)),
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
            _deliverOrder(uuid);
          },
          child: const Text("Vendi", style: TextStyle(fontSize: 20)),
        );
      case Status.DELIVERED:
        return const Text("Ordine completato", style: TextStyle(fontSize: 20));
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

  Future<void> _acceptOrder(String uuid) async {
    await CallApi().putData('ordine/accept?uuid=$uuid');
    setState(() {
      myOrdersList = getMyOrders();
    });
  }

  Future<void> _deliverOrder(String uuid) async {
    await CallApi().putData('ordine/sell?uuid=$uuid');
    setState(() {
      myOrdersList = getMyOrders();
    });
  }
}

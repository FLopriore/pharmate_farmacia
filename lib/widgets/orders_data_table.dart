import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/data/api.dart';
import 'package:pharmate_farmacia/data/order.dart';

class OrdersDataTable extends StatefulWidget {
  const OrdersDataTable({super.key});

  @override
  State<OrdersDataTable> createState() => _OrdersDataTableState();
}

class _OrdersDataTableState extends State<OrdersDataTable> {
  List<Order> listOrders = [];

  @override
  void initState() {
    super.initState();
    _getOrdersList();
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
        sortColumnIndex: 0,
        sortAscending: true,
        columns: const [
          DataColumn(
            label:
                Text("Prodotto", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          DataColumn(
            label: Text("Qtà", style: TextStyle(fontWeight: FontWeight.bold)),
            numeric: true,
          ),
          DataColumn(
            label:
                Text("Status", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          DataColumn(
            label:
                Text("Azione", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
        rows: List<DataRow>.generate(
            listOrders.length,
            (int index) => DataRow(cells: <DataCell>[
                  DataCell(Text(listOrders[index].prodotto.nome)),
                  DataCell(Text(listOrders[index].quantita.toString())),
                  DataCell(
                    Center(
                      child: Icon(
                        Icons.circle,
                        color: _getStatusColor(listOrders[index].status),
                      ),
                    ),
                  ),
                  DataCell(_getWidget(listOrders[index].status)),
                ])));
  }

  Color _getStatusColor(Status status) {
    switch (status) {
      case Status.red:
        return Colors.red;
      case Status.yellow:
        return Colors.yellow;
      case Status.green:
        return Colors.green;
    }
  }

  // Gets pending orders from the server and adds them in listOrders.
  void _getOrdersList() async {
    var responseJson = await CallApi().getData('ordini/farmacia');
    if (responseJson != null) {
      List<Order> orders =
          List<Order>.from(responseJson.map((model) => Order.fromJson(model)));
      setState(() {
        listOrders = orders;
      });
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
      case Status.red:
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
      case Status.yellow:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Color(0xff023D74),
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
      case Status.green:
        return const Text("Ordine completato");
    }
  }
}

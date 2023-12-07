import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/widgets/orders_data_table.dart';
import 'package:pharmate_farmacia/widgets/rounded_background_rectangle.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Ordini",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 60,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: RoundedBackgroundRectangle(child: OrdersDataTable()),
            ),
          )
        ],
      ),
    );
  }
}

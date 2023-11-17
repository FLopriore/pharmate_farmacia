import 'package:flutter/material.dart';
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
          Align(
            alignment: Alignment.center,
            child:Text(
              "Controlla e gestisci gli ordini della tua Farmacia",
              style: TextStyle(fontWeight: FontWeight.normal,fontStyle: FontStyle.italic,fontSize: 25,color:Colors.black),
            ),
            ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: RoundedBackgroundRectangle(child: Placeholder()),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/providers/history_provider.dart';
import 'package:pharmate_farmacia/widgets/history_data_table.dart';
import 'package:pharmate_farmacia/widgets/rounded_background_rectangle.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

    @override

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => History(),
      child: const Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           SizedBox(height: 20),
           Align(
            alignment: Alignment.center,
            child: Text(
              "Storico Ordini",
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
              child: RoundedBackgroundRectangle(child: HistoryDataTable()),
            ),
          )
        ]),
      ),
    );
  }
  }
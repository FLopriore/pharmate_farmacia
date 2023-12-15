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
      child: Scaffold(
        body: Column(children: [
          const SizedBox(height: 20),
          const Text(
            "Storico Ordini",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 60,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: RoundedBackgroundRectangle(child: HistoryDataTable()),
          ))
        ]),
      ),
    );
  }
  }
import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/providers/warehouse_provider.dart';
import 'package:pharmate_farmacia/widgets/add_stock_text_field.dart';
import 'package:provider/provider.dart';

class DialogAddStock extends StatefulWidget {
  const DialogAddStock({super.key});

  @override
  State<DialogAddStock> createState() => _DialogAddStockState();
}

class _DialogAddStockState extends State<DialogAddStock> {
  TextEditingController medicineCodeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var warehouse = Provider.of<Warehouse>(context);
    return AlertDialog(
      title: const Text(
        "Aggiungi Giacenza",
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //position
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Farmaco",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          AddStockTextField(
            controller: medicineCodeController,
            hint: "Inserisci il codice del Farmaco",
          ),
          const SizedBox(height: 15),
          const Text(
            "Quantità",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          AddStockTextField(
            controller: quantityController,
            hint: "Qtà",
          ),
        ],
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xff023D74),
            foregroundColor: Colors.white,
            fixedSize: const Size.fromHeight(55),
          ),
          onPressed: () {
            warehouse.addItemToStock(
                medicineCodeController.text, quantityController.text);
            setState(() {
              medicineCodeController.text = "";
              quantityController.text = "";
            });
          },
          child: const Text("Aggiungi"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xffCAE6FF),
            foregroundColor: const Color(0xff023D74),
            fixedSize: const Size.fromHeight(55),
          ),
          child: const Text("Annulla"),
        ),
      ],
    );
  }
}

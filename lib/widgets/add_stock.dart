import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmate_farmacia/data/api.dart';

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
          TextField(
            controller: medicineCodeController,
              decoration: const InputDecoration(
                hintText: "Inserisci il codice del Farmaco",
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                fillColor: Colors.white,
                filled: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ]),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Quantità",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          TextField(
            controller: quantityController,
            decoration: const InputDecoration(
                hintText: "Qtà",
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                fillColor: Colors.white,
                filled: true),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
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
          onPressed: () async {
            var data = {
              'codiceProdotto': medicineCodeController.text,
              'qta': quantityController.text,
              // TODO: add pharmacy code
            };
            await CallApi().postData(data, 'magazzino');
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

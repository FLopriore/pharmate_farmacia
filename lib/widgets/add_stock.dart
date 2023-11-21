import 'package:flutter/material.dart';

class DialogAddStock extends StatefulWidget {
  const DialogAddStock({super.key});

  @override
  State<DialogAddStock> createState() => _DialogAddStockState();
}
class _DialogAddStockState extends State<DialogAddStock> {

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      content: Scaffold(
        appBar:AppBar(title: const Text("Aggiungi Giacenza",style: TextStyle(fontWeight: FontWeight.w900),),),
        ),
    );
  }
}
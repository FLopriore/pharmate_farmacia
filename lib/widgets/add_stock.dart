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
      title: const Text("Aggiungi Giacenza",style: TextStyle(fontWeight: FontWeight.w800),),
      content:const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          //position
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Farmaco",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
          TextField(decoration: InputDecoration(hintText: "Inserisci il codice del Farmaco",border: OutlineInputBorder(),fillColor: Colors.white,filled: true,),),
          SizedBox(height: 10,),
          Text("Quantità",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
          TextField(decoration: InputDecoration(hintText: "Qtà",border: OutlineInputBorder(),fillColor: Colors.white,filled: true),),
        ],),
      actions: [
        TextButton(
          onPressed: (){}, 
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xff0888fd),
            foregroundColor: Colors.white,
            fixedSize: Size.fromHeight(45),
          ),
          child: const Text("Aggiungi"),), //TODO: Add to db the drugs
        TextButton(
          onPressed: (){Navigator.pop(context);}, 
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xffCAE6FF),
            foregroundColor: const Color(0xff0888fd),
            fixedSize: Size.fromHeight(45),
          ),
          child: const Text("Annulla"),), 
      ],
    );
  }
}
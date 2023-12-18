import 'package:flutter/material.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({super.key});

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Cambia Password",
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
      ),
      content: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //position
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Vecchia Password",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            width: 250,
            child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Inserisci Vecchia Password",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  fillColor: Colors.white,
                  filled: true,
                )),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100)),
          Text(
            "Nuova Password",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            width: 250,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Inserisci Nuova Password",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xff023D74),
            foregroundColor: Colors.white,
            fixedSize: const Size.fromHeight(55),
          ),
          child: const Text("Cambia Password"),
        ), //TODO: Add to db the drugs
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

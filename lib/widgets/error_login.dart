import 'package:flutter/material.dart';

class DialogErrorLogin extends StatefulWidget {
  const DialogErrorLogin({super.key});

  @override
  State<DialogErrorLogin> createState() => _DialogErrorLoginState();
}

class _DialogErrorLoginState extends State<DialogErrorLogin> {
  /*void _deleteUser() async {
  await CallApi().deleteData("users/");
}*/

  @override
  Widget build(BuildContext context) {
    
    return AlertDialog(
      title: const Text("Errore",style:TextStyle(fontWeight: FontWeight.w800, fontSize: 35),
      ),
      content: const Text("Ops, qualcosa è andato storto, prova a reinserire i dati della farmacia assicurandoti siano giusti",
      style:TextStyle(fontWeight: FontWeight.normal, fontSize: 20)),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xff023D74),
            foregroundColor: const Color(0xffCAE6FF),
            fixedSize: const Size.fromWidth(100),
          ),
          child: const Text("Riprova",style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),),
        ),
      ],

    );
  }
}
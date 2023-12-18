import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/authorization/login_secure_storage.dart';
import 'package:pharmate_farmacia/screens/login_page.dart';

class DialogConfirmLogOut extends StatefulWidget {
  const DialogConfirmLogOut({super.key});

  @override
  State<DialogConfirmLogOut> createState() => _DialogConfirmLogOutState();
}

class _DialogConfirmLogOutState extends State<DialogConfirmLogOut> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Log Out",
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 40),
      ),
      content: const Text(
          "Sei sicuro di uscire dal profilo? \nRicordati che dovrai effetuare di nuovo il login.",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20)),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xff023D74),
            foregroundColor: Colors.white,
            fixedSize: const Size.fromWidth(150),
            elevation: 5
          ),
          onPressed: () {
            LoginSecureStorage.deleteLoginSecureStorage();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (Route<dynamic> route) => false);
          },
          child: const Text("Conferma",style: TextStyle(fontSize: 20),),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xffCAE6FF),
            foregroundColor: const Color(0xff023D74),
            fixedSize: const Size.fromWidth(150),
            elevation: 5
          ),
          child: const Text("Annulla",style: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}

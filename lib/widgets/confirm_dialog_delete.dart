import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/authorization/login_secure_storage.dart';
import 'package:pharmate_farmacia/data/api.dart';
import 'package:pharmate_farmacia/screens/login_page.dart';

class DialogConfirmDelete extends StatefulWidget {
  const DialogConfirmDelete({super.key});

  @override
  State<DialogConfirmDelete> createState() => _DialogConfirmDeleteState();
}

class _DialogConfirmDeleteState extends State<DialogConfirmDelete> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Elimina Account",
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 40),
      ),
      content: const Text(
          "Sei sicuro di voler cancellare il tuo account Pharmate?\nL'operazione è irreversibile.",
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
            _deleteUser();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (Route<dynamic> route) => false);
          },
          child: const Text("Conferma",style: TextStyle(fontSize: 20)),
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

  Future<void> _deleteUser() async {
    bool deleteSuccess = await CallApi().deleteData("users/");
    if (deleteSuccess) LoginSecureStorage.deleteLoginSecureStorage();
  }
}

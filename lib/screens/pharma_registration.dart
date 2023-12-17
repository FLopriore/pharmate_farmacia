import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/authorization/authorization.dart';
import 'package:pharmate_farmacia/widgets/login_text.dart';
import 'package:pharmate_farmacia/widgets/nav_rail.dart';
import 'package:pharmate_farmacia/widgets/rounded_text_field.dart';

class PharmaRegistrationPage extends StatefulWidget {
  const PharmaRegistrationPage({super.key});

  @override
  State<PharmaRegistrationPage> createState() => _PharmaRegistrationPageState();
}

class _PharmaRegistrationPageState extends State<PharmaRegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Registra la tua Farmacia",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 50,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const LoginText(text: "Nome farmacia"),
            RoundedTextField(
                controller: nameController,
                hintText: "Es. Farmacia San Nicola",
            ),
            const LoginText(text: "Città"),
            RoundedTextField(
              controller: cityController,
              hintText: "Es. Bari",
            ),
            const LoginText(text: "Codice"),
            RoundedTextField(
              controller: codeController,
              hintText: 'Inserisci il codice a 11 caratteri della farmacia',
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff023D74),
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  await Authorization()
                      .createPharmacy(nameController.text,cityController.text,
                          codeController.text,)
                      .then((bool success) {
                    if (success) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const NavRail()));
                    } // TODO: add dialog to show signup error
                  });
                },
                icon: const Icon(Icons.navigate_next),
                label: const Text("Entra"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

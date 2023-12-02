import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/widgets/change_password.dart';
import 'package:pharmate_farmacia/widgets/profile_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Farmacia del Cambio",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 60,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 500,
              height: 250,
              child: GridView.count(
                shrinkWrap: true,
                primary: false,
                crossAxisSpacing: 30,
                mainAxisSpacing: 10,
                childAspectRatio: 5,
                crossAxisCount: 2,
                children: const <Widget>[
                  ProfileText(title: 'Città: ', textAlign: TextAlign.end),
                  ProfileText(title: 'Bari', textAlign: TextAlign.start), // TODO: add data from DB
                  ProfileText(title: 'Via: ', textAlign: TextAlign.end),
                  ProfileText(title: 'Via Marco Polo', textAlign: TextAlign.start), // TODO: add data from DB
                  ProfileText(title: 'Partita IVA: ', textAlign: TextAlign.end),
                  ProfileText(title: 'N0NCH0S0RD1', textAlign: TextAlign.start), // TODO: add data from DB
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff023D74),
                    foregroundColor: Colors.white,
                    fixedSize: const Size.fromHeight(45),
                  ),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => const ChangePass()),
                  icon: const Icon(Icons.lock),
                  label: const Text(
                    "Cambia Password ",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                  )),
            ), //TODO: Change Password PopUp
            const SizedBox(
              height: 10,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffCAE6FF),
                    foregroundColor: const Color(0xff023D74),
                    fixedSize: const Size.fromHeight(45),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text(
                    "Logout ",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

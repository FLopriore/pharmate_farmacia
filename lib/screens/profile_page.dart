import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/data/api.dart';
import 'package:pharmate_farmacia/data/pharmacy.dart';
import 'package:pharmate_farmacia/data/user.dart';
import 'package:pharmate_farmacia/json_useful_fields.dart';
import 'package:pharmate_farmacia/widgets/confirm_dialog_delete.dart';
import 'package:pharmate_farmacia/widgets/confirm_dialog_logout.dart';
import 'package:pharmate_farmacia/widgets/profile_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<Utente> userInfo;

  @override
  void initState() {
    super.initState();
    userInfo = _getInfo();
  }

  @override
  Widget build(BuildContext context) {
    _getInfo();
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Profilo Farmacia",
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
              width: 700,
              height: 250,
              child: GridView.count(
                shrinkWrap: true,
                primary: false,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                childAspectRatio: 7,
                crossAxisCount: 2,
                children: <Widget>[
                  const ProfileText(title: 'Nome: ', textAlign: TextAlign.end),
                  FutureBuilder(
                      future: userInfo,
                      builder: (BuildContext context,
                          AsyncSnapshot<Utente> snapshot) {
                        if (snapshot.hasData) {
                          return ProfileText(
                              title: snapshot.data!.worksIn.nome,
                              textAlign: TextAlign.start);
                        } else {
                          return const Text("");
                        }
                      }),
                  const ProfileText(title: 'Città: ', textAlign: TextAlign.end),
                  FutureBuilder(
                      future: userInfo,
                      builder: (BuildContext context,
                          AsyncSnapshot<Utente> snapshot) {
                        if (snapshot.hasData) {
                          return ProfileText(
                              title: snapshot.data!.worksIn.citta,
                              textAlign: TextAlign.start);
                        } else {
                          return const Text("");
                        }
                      }),
                  const ProfileText(
                      title: 'Codice: ', textAlign: TextAlign.end),
                  FutureBuilder(
                      future: userInfo,
                      builder: (BuildContext context,
                          AsyncSnapshot<Utente> snapshot) {
                        if (snapshot.hasData) {
                          return ProfileText(
                              title: snapshot.data!.worksIn.codice_farmacia,
                              textAlign: TextAlign.start);
                        } else {
                          return const Text("");
                        }
                      }),
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
                    fixedSize: const Size.fromWidth(220),
                  ),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const DialogConfirmLogOut()),
                  icon: const Icon(Icons.logout),
                  label: const Text(
                    "LogOut ",
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
                    fixedSize: const Size.fromWidth(220),
                  ),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const DialogConfirmDelete()),
                  icon: const Icon(Icons.warning),
                  label: const Text(
                    "Elimina Account",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future<Utente> _getInfo() async {
    var responseJson = await CallApi().getData("users/me");
    Utente infoResults;
    if (responseJson != null) {
      var modResponseJson = JsonUsefulFields.getPharmaFields(responseJson);
      infoResults = Utente.fromJson(modResponseJson);
    } else {
      infoResults = Utente("", "", "", Pharmacy("", "", ""));
    }
    return infoResults;
  }
}
